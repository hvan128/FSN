import 'package:flutter/material.dart';
import 'package:frontend/screens/account/account_screen.dart';
import 'package:frontend/screens/community/community_screen.dart';
import 'package:frontend/screens/my_fridge/my_fridge_screen.dart';
import 'package:frontend/screens/report/report_screen.dart';
import 'package:frontend/screens/to_do/shopping_list_screen.dart';
import 'package:frontend/screens/to_do/to_do_screen.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _isShowBottomBar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: !_isShowBottomBar
          ? null
          : Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    tooltip: "Tủ lạnh",
                    icon: _navigateItem(
                        _currentIndex == 0 ? true : false,
                        'Tủ lạnh',
                        Image.asset('assets/icons/i16/home.png',
                            width: 25,
                            height: 25,
                            color: _currentIndex == 0
                                ? MyColors.primary['CulturalYellow']!['c700']!
                                : MyColors.grey['c500']!)),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    tooltip: "Cộng đồng",
                    icon: _navigateItem(
                        _currentIndex == 1 ? true : false,
                        'Cộng đồng',
                        Image.asset('assets/icons/i16/users.png',
                            width: 25,
                            height: 25,
                            color: _currentIndex == 1
                                ? MyColors.primary['CulturalYellow']!['c700']!
                                : MyColors.grey['c500']!)),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    tooltip: "Danh sách",
                    icon: _navigateItem(
                        _currentIndex == 2 ? true : false,
                        'Danh sách',
                        Image.asset('assets/icons/i16/list.png',
                            width: 25,
                            height: 25,
                            color: _currentIndex == 2
                                ? MyColors.primary['CulturalYellow']!['c700']!
                                : MyColors.grey['c500']!)),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: _navigateItem(
                        _currentIndex == 3 ? true : false,
                        'Báo cáo',
                        Image.asset('assets/icons/i16/chart.png',
                            width: 25,
                            height: 25,
                            color: _currentIndex == 3
                                ? MyColors.primary['CulturalYellow']!['c700']!
                                : MyColors.grey['c500']!)),
                    tooltip: "Withdrawal",
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: _navigateItem(
                        _currentIndex == 4 ? true : false,
                        'Tài khoản',
                        Image.asset('assets/icons/i16/account.png',
                            width: 25,
                            height: 25,
                            color: _currentIndex == 4
                                ? MyColors.primary['CulturalYellow']!['c700']!
                                : MyColors.grey['c500']!)),
                    tooltip: "More",
                    label: '',
                  )
                ],
                selectedLabelStyle: const TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: FontSize.z12,
                  height: 1.3,
                  fontWeight: FontWeight.w600,
                ),
                selectedItemColor: MyColors.primary['CulturalYellow']!['c700']!,
                backgroundColor: Colors.white,
                unselectedItemColor: MyColors.grey['c600']!,
              ),
            ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return MyFridgeScreen(
            showBottomBar: (bool value) => handleShowBottomBar(value),
            navigateBottomBar: (int index) => handleNavigateBottomBar(index));
      case 1:
        return const CommunityScreen();
      case 2:
        return ShoppingListScreen(
            showBottomBar: (bool value) => handleShowBottomBar(value),
            navigateBottomBar: (int index) => handleNavigateBottomBar(index));
      case 3:
        return ReportScreen(
          showBottomBar: (bool value) => handleShowBottomBar(value),
          navigateBottomBar: (int index) => handleNavigateBottomBar(index),
        );
      case 4:
        return const AccountScreen();
      default:
        return Container();
    }
  }

  Widget _navigateItem(bool isSelected, String label, Widget icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(child: icon),
        const SizedBox(
          height: 4,
        ),
        MyText(
            text: label,
            fontSize: FontSize.z12,
            fontWeight: FontWeight.w600,
            color: isSelected
                ? MyColors.primary['CulturalYellow']!['c700']!
                : MyColors.grey['c600']!)
      ],
    );
  }

  handleShowBottomBar(bool isShow) {
    setState(() {
      _isShowBottomBar = isShow;
    });
  }

  handleNavigateBottomBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
