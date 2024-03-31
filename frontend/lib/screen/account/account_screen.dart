import 'package:flutter/material.dart';
import 'package:frontend/components/account/my_food_field.dart';
import 'package:frontend/screen/community/add_dish_screen.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/text.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
      SliverAppBar(
          pinned: true,
          expandedHeight: 200,
          backgroundColor: MyColors.white['c900']!,
          automaticallyImplyLeading: false,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            MyIconButton(
                onPressed: () {},
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
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Column(
                children: [
                  _buildAddButton(),
                  const SizedBox(height: 10),
                  const MyFoodField(),
                ],
              ),
              const Center(
                child: Text('Môn ăn đã lưu'),
              )
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
            const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  'https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-6/344771274_635656204564021_5313788662963468311_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHOKImvTwCiDzliOSGGKL_NJufFjy4-vqEm58WPLj6-oQxnd0EhiFoOlqZgBSwhBo7iM378XRvIqQlK56Ma37ZB&_nc_ohc=lFehLRvcoeMAX9IEo4n&_nc_ht=scontent.fhan14-3.fna&oh=00_AfCX7HzV8vA-uHApwtNlP10nHn5Nk20nLCC8xciA06Y_SQ&oe=6604A259'),
            ),
            const SizedBox(width: 20),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyText(
                    text: 'Ngô Hải Văn',
                    fontSize: FontSize.z20,
                    fontWeight: FontWeight.w600,
                    color: MyColors.grey['c900']!,
                  ),
                  MyText(
                    text: '@hvan128',
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
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AddDishScreen();
            }));
          },
        )
      ]),
    );
  }
}
