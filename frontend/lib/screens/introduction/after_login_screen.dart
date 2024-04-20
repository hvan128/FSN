import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/navigation.dart';
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
    await ApiService.get('${Config.USER_API}/${userLogin!.data!.id}')
        .then((value) {
      if (value != null) {
        setState(() {
          user = UserModel.fromJson(jsonDecode(value)[0]);
        });
        Provider.of<UserProvider>(context, listen: false)
            .setUser(user: UserModel.fromJson(jsonDecode(value)[0]));
      }
    });
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
