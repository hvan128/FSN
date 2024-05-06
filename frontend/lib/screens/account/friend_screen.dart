import 'package:flutter/material.dart';
import 'package:frontend/components/account/my_food_field.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/navigation/router/community.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/text.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final arguments = ModalRoute.of(context)?.settings.arguments as Map;
      setState(() {
        user = arguments['owner'];
      });
    });
  }

  @override
  void dispose() {
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
                    icon: Image.asset('assets/icons/i16/dots-vertical.png',
                        width: 25, height: 25, color: MyColors.grey['c900']!)),
              ],
            ),
          ]),
          flexibleSpace: FlexibleSpaceBar(
            background: _buildHeader(),
          )),
      SliverToBoxAdapter(
        child: Container(
          color: MyColors.primary['CulturalYellow']!['c50']!,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 10),
              user == null ? Container() : MyFoodField(
                userId: user!.id!,
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
            CircleAvatar(
              radius: 40,
              backgroundImage:
                  user?.imageUrl == null ? null : NetworkImage(user!.imageUrl!),
            ),
            const SizedBox(width: 20),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyText(
                    text: user?.displayName ?? '',
                    fontSize: FontSize.z20,
                    fontWeight: FontWeight.w600,
                    color: MyColors.grey['c900']!,
                  ),
                  MyText(
                    text: '@${user?.username ?? ''}',
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

  Widget _buildAddButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      width: double.infinity,
      color: MyColors.white['c900']!,
      child: Column(children: [
        Image.asset('assets/images/new-food.png',
            width: 150, color: MyColors.grey['c900']!),
        const SizedBox(height: 10),
        MyText(
          text: 'Lưu trữ tất cả món bạn nấu ở cùng một nơi',
          fontSize: FontSize.z20,
          fontWeight: FontWeight.w600,
          color: MyColors.grey['c800']!,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        MyText(
          text: 'Và chia sẻ với gia đình & bạn bè',
          fontSize: FontSize.z16,
          fontWeight: FontWeight.w400,
          color: MyColors.grey['c600']!,
        ),
        const SizedBox(height: 15),
        MyButton(
          width: 200,
          text: 'Viết món mới',
          onPressed: () {
            Navigator.pushNamed(context, RouterCommunity.addDish);
          },
        )
      ]),
    );
  }
}
