import 'package:flutter/material.dart';
import 'package:frontend/screen/account/account_screen.dart';
import 'package:frontend/screen/community/community_screen.dart';
import 'package:frontend/screen/my_fridge/my_fridge_screen.dart';
import 'package:frontend/screen/report/report_screen.dart';
import 'package:frontend/screen/to_do/to_do_screen.dart';
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
                    tooltip: "Home",
                    icon: _navigateItem(
                        _currentIndex == 0 ? true : false,
                        'Home',
                        Image.asset('assets/icons/home.png',
                            width: 25,
                            height: 25,
                            color: _currentIndex == 0
                                ? MyColors.primary['CulturalYellow']!['c700']!
                                : MyColors.grey['c500']!)),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    tooltip: "Account",
                    icon: _navigateItem(
                        _currentIndex == 1 ? true : false,
                        'Account',
                        Image.asset('assets/icons/home.png',
                            width: 25,
                            height: 25,
                            color: _currentIndex == 1
                                ? MyColors.primary['CulturalYellow']!['c700']!
                                : MyColors.grey['c500']!)),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                      icon: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: MyColors.grey['c300'],
                        ),
                        child: Image.asset('assets/icons/home.png',
                            width: 25,
                            height: 25,
                            color: _currentIndex == 2
                                ? MyColors.primary['CulturalYellow']!['c700']!
                                : MyColors.grey['c500']!),
                      ),
                      tooltip: "Todo",
                      label: ''),
                  BottomNavigationBarItem(
                    icon: _navigateItem(
                        _currentIndex == 3 ? true : false,
                        'Withdrawal',
                        Image.asset('assets/icons/home.png',
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
                        'More',
                        Image.asset('assets/icons/home.png',
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
        return TodoScreen(
            showBottomBar: (bool value) => handleShowBottomBar(value),
            navigateBottomBar: (int index) => handleNavigateBottomBar(index));
      case 3:
        return const ReportScreen();
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
