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
      print('cache exist');
      var cacheData =
          await APICacheManager().getCacheData('categories_$positionId');
      final data = jsonDecode(cacheData.syncData)['data'];
      return categoryFromJson(data);
    } else {
      print('cache not exist');
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
  Future deleteCache () async {
    await APICacheManager().deleteCache('categories_1');
    await APICacheManager().deleteCache('categories_2');
    await APICacheManager().deleteCache('categories_3');
  }
}