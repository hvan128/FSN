import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/components/community/my_kitchen_dishes.dart';
import 'package:frontend/components/community/recent_recipes.dart';
import 'package:frontend/screens/account/account_screen.dart';
import 'package:frontend/screens/search/search_screen.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  Widget _buildHeader() {
    return Stack(children: [
      Column(
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    MyColors.primary['CulturalYellow']!['c600']!,
                    MyColors.primary['CulturalYellow']!['c600']!
                        .withOpacity(0.0),
                  ],
                  stops: const [
                    0.1,
                    1.0
                  ]),
            ),
          ),
        ],
      ),
      SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchScreen(type: SearchType.mine);
                }));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: MyColors.primary['CulturalYellow']!['c50']!,
                        border: Border.all(
                          color: MyColors.grey['c100']!,
                        ),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: MyColors.grey['c500']!.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(children: [
                        Image.asset(
                          'assets/icons/i16/search.png',
                          width: 18,
                          height: 18,
                          color: MyColors.grey['c500'],
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MyText(
                          text: 'Gõ vào tên các nguyên liệu...',
                          fontSize: FontSize.z16,
                          fontWeight: FontWeight.w400,
                          color: MyColors.grey['c500']!,
                        )
                      ]),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const AccountScreen();
                      }));
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor:
                          MyColors.primary['CulturalYellow']!['c600']!,
                      backgroundImage:
                          const AssetImage('assets/icons/i16/logo.png'),
                    ),
                  )
                ],
              ),
            )),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            floating: true,
            flexibleSpace: _buildHeader(),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                    color: MyColors.white['c900']!,
                    child: const MyKitchenDishes()),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: MyColors.white['c900']!,
                  child: const RecentRecipes(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
