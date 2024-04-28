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

  Future deleteCache() async {
    await APICacheManager().deleteCache('categories_1');
    await APICacheManager().deleteCache('categories_2');
    await APICacheManager().deleteCache('categories_3');
    await APICacheManager().deleteCache('categories');
  }

  Future<List<Category>> getAllCategories() async {
    List<dynamic> categories = [];
    var isCacheExist = await APICacheManager().isAPICacheKeyExist('categories');
    if (isCacheExist) {
      print('cache exist');
      var cacheData = await APICacheManager().getCacheData('categories');
      final data = jsonDecode(cacheData.syncData);
      return categoryFromJson(data);
    } else {
      var cache1Exist =
          await APICacheManager().isAPICacheKeyExist('categories_1');
      var cache2Exist =
          await APICacheManager().isAPICacheKeyExist('categories_2');
      var cache3Exist =
          await APICacheManager().isAPICacheKeyExist('categories_3');
      if (cache1Exist || cache2Exist || cache3Exist) {
        print('cache exist 1');
        var cache1Data = await APICacheManager().getCacheData('categories_1');
        var cache2Data = await APICacheManager().getCacheData('categories_2');
        var cache3Data = await APICacheManager().getCacheData('categories_3');
        final data1 = jsonDecode(cache1Data.syncData)['data'];
        final data2 = jsonDecode(cache2Data.syncData)['data'];
        final data3 = jsonDecode(cache3Data.syncData)['data'];
        categories = data1 + data2 + data3;
        print(categories.length);
        APICacheDBModel cacheDBModel = APICacheDBModel(
          key: 'categories',
          syncData: jsonEncode(categories),
        );
        APICacheManager().addCacheData(cacheDBModel);
      } else {
        await ApiService.get('${Config.CATEGORIES_API}/${user.fridgeId}')
            .then((value) {
          if (value != null) {
            final data = jsonDecode(value.toString())['data'];
            categories = data;
          }
        });
        APICacheDBModel cacheDBModel = APICacheDBModel(
          key: 'categories',
          syncData: jsonEncode(categories),
        );
        APICacheManager().addCacheData(cacheDBModel);
      }
      return categoryFromJson(categories);
    }
  }

  Future<void> deleteCategory(int id) async {
    await ApiService.delete('${Config.CATEGORIES_API}/$id');   
    await APICacheManager().deleteCache('categories'); 
  } 
}
