import 'package:flutter/material.dart';
import 'package:frontend/components/account/my_food_field.dart';
import 'package:frontend/components/account/my_saved_dish.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  UserModel user = UserModel();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    user = Provider.of<UserProvider>(context, listen: false).user!;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverAppBar(
          pinned: true,
          expandedHeight: 200,
          backgroundColor: MyColors.white['c900']!,
          automaticallyImplyLeading: false,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            MyIconButton(
                onPressed: () {
                  Navigate.pop();
                },
                icon: Image.asset('assets/icons/i16/back.png',
                    width: 25, height: 25, color: MyColors.grey['c900']!)),
            Row(
              children: [
                MyIconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/i16/upload.png',
                        width: 25, height: 25, color: MyColors.grey['c900']!)),
                const SizedBox(width: 20),
                MyIconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/i16/setting.png',
                        width: 25, height: 25, color: MyColors.grey['c900']!)),
              ],
            ),
          ]),
          bottom: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: const Tab(
                  text: 'Món của tôi',
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: const Tab(
                  text: 'Món đã lưu',
                ),
              ),
            ],
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: _buildHeader(),
          )),
      SliverToBoxAdapter(
        child: Container(
          color: MyColors.primary['CulturalYellow']!['c50']!,
          height: 1250,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Column(
                children: [
                  const SizedBox(height: 10),
                  MyFoodField(userId: user.id!),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 10),
                  MySavedDish(userId: user.id!),
                ],
              ),
            ],
          ),
        ),
      )
    ]));
  }

  Widget _buildHeader() {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: user.imageUrl != null
                  ? Image.network(
                      user.imageUrl!,
                      width: 80,
                      height: 80,
                    )
                  : Image.asset('assets/icons/i16/image-default.png',
                      width: 80, height: 80),
            ),
            const SizedBox(width: 20),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyText(
                    text: user.displayName ?? '',
                    fontSize: FontSize.z20,
                    fontWeight: FontWeight.w600,
                    color: MyColors.grey['c900']!,
                  ),
                  MyText(
                    text: '@${user.username ?? ''}',
                    fontSize: FontSize.z15,
                    fontWeight: FontWeight.w400,
                    color: MyColors.grey['c900']!,
                  ),
                  const SizedBox(height: 5),
                  Row(children: [
                    MyText(
                      text: '0',
                      fontSize: FontSize.z15,
                      fontWeight: FontWeight.w600,
                      color: MyColors.grey['c900']!,
                    ),
                    MyText(
                      text: ' Người quan tâm',
                      fontSize: FontSize.z15,
                      fontWeight: FontWeight.w400,
                      color: MyColors.grey['c700']!,
                    ),
                    const SizedBox(width: 25),
                    MyText(
                      text: '20',
                      fontSize: FontSize.z15,
                      fontWeight: FontWeight.w600,
                      color: MyColors.grey['c900']!,
                    ),
                    MyText(
                      text: ' Bạn bếp',
                      fontSize: FontSize.z15,
                      fontWeight: FontWeight.w400,
                      color: MyColors.grey['c700']!,
                    )
                  ]),
                ]),
          ]),
        ],
      ),
    ));
  }

  
}
