import 'dart:convert';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/api_service.dart';
import 'package:provider/provider.dart';

class CategoryService {
  UserModel user = Provider.of<UserProvider>(
          Navigate().navigationKey.currentContext!,
          listen: false)
      .user!;
  Future<List<Category>> getCategoriesByPosition({
    required int positionId,
  }) async {
    List<Category> categories = [];
    var isCacheExist =
        await APICacheManager().isAPICacheKeyExist('categories_$positionId');
    if (isCacheExist) {
      var cacheData =
          await APICacheManager().getCacheData('categories_$positionId');
      final data = jsonDecode(cacheData.syncData)['data'];
      return categoryFromJson(data);
    } else {
      await ApiService.get(
              '${Config.CATEGORIES_API}/position/$positionId/${user.fridgeId}')
          .then((value) {
        if (value != null) {
          final data = jsonDecode(value.toString())['data'];
          categories = categoryFromJson(data);
          APICacheDBModel cacheDBModel = APICacheDBModel(
            key: 'categories_$positionId',
            syncData: value.toString(),
          );
          APICacheManager().addCacheData(cacheDBModel);
        } else {
          return [];
        }
      });
      return categories;
    }
  }

  Future<List<Category>> getNewCategories(int fridgeId) async {
    List<Category> categories = [];
    final isCacheExist =
        await APICacheManager().isAPICacheKeyExist('categories_new');
    if (isCacheExist) {
      var cacheData = await APICacheManager().getCacheData('categories_new');
      final data = jsonDecode(cacheData.syncData)['data'];
      return categoryFromJson(data);
    } else {
      await ApiService.get('${Config.NEW_CATEGORY_API}/$fridgeId')
          .then((value) {
        if (value != null) {
          final data = jsonDecode(value.toString())['data'];
          categories = categoryFromJson(data);
        }
        APICacheDBModel cacheDBModel = APICacheDBModel(
          key: 'categories_new',
          syncData: value.toString(),
        );
        APICacheManager().addCacheData(cacheDBModel);
      });
    }
    return categories;
  }

  Future<int> getShoppingListLength() async {
    final list = await getCategoriesByPosition(positionId: 0);
    return list.length;
  }

  Future deleteCache() async {
    await APICacheManager().deleteCache('categories_1');
    await APICacheManager().deleteCache('categories_2');
    await APICacheManager().deleteCache('categories_3');
  }

  Future<List<Category>> getAllCategories() async {
    List<Category> categories = [];
    final data1 = await getCategoriesByPosition(positionId: 1);
    final data2 = await getCategoriesByPosition(positionId: 2);
    final data3 = await getCategoriesByPosition(positionId: 3);
    categories = data1 + data2 + data3;
    return categories;
  }

  Future<void> deleteCategory(int id) async {
    await ApiService.delete('${Config.CATEGORIES_API}/$id');
    await APICacheManager().deleteCache('categories');
  }
}
