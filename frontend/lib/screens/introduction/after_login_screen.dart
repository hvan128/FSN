import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/introduction/create_fridge_screen.dart';
import 'package:frontend/screens/loading/loading_screen.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/auth/shared_service.dart';
import 'package:provider/provider.dart';

class AfterLoginScreen extends StatefulWidget {
  const AfterLoginScreen({super.key});

  @override
  State<AfterLoginScreen> createState() => _AfterLoginScreenState();
}

class _AfterLoginScreenState extends State<AfterLoginScreen> {
  UserModel? user;
  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  void fetchUser() async {
    final userLogin = await SharedService.loginDetails();
    var isCacheExist = await APICacheManager()
        .isAPICacheKeyExist('user_${userLogin!.data!.id}');
    if (isCacheExist) {
      print('cache user exist');
      var cacheData =
          await APICacheManager().getCacheData('user_${userLogin.data!.id}');
      setState(() {
        user = UserModel.fromJson(jsonDecode(cacheData.syncData)[0]);
      });
    } else {
      print('cache user not exist');
      await ApiService.get('${Config.USER_API}/${userLogin.data!.id}')
          .then((value) {
        if (value != null) {
          setState(() {
            user = UserModel.fromJson(jsonDecode(value)[0]);
          });
          APICacheDBModel cacheDBModel = APICacheDBModel(
            key: 'user_${userLogin.data!.id}',
            syncData: value.toString(),
          );
          APICacheManager().addCacheData(cacheDBModel);
        }
      });
    }
    Provider.of<UserProvider>(context, listen: false).setUser(user: user!);
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const LoadingScreen();
    } else if (user!.fridgeId != null) {
      return const HomeScreen();
    } else {
      return const CreateFridgeScreen();
    }
  }
}
