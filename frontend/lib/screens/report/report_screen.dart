import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/category/category_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/calendar_picker/calendar_picker.dart';
import 'package:frontend/widgets/calendar_picker/shared/picker_type.dart';
import 'package:frontend/widgets/card_header.dart';
import 'package:frontend/widgets/charts/donut_chart.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({
    super.key,
  });

  @override
  State<ReportScreen> createState() => _ReportScreen();
}

class _ReportScreen extends State<ReportScreen> {
  double amount = 34921000.00;
  final DateFormat formatter = DateFormat('HH:mm - MMM DD, yyyy');
  final DateFormat formatterPeriod = DateFormat('dd-MM-yyyy');
  bool _isFocus = false;
  DateTime firstDay = DateTime.now().subtract(Duration(days: 30));
  DateTime lastDay = DateTime.now();
  String? contractId;
  Map<String, dynamic> totalCategory = {};
  String? sort;
  List<ArcType> mockDonut = [];
  bool isLoad = false;
  int totalType = 0;
  Map<String, dynamic> colorMap = {
    'totalCategoryDrinks': MyColors.primary['KiduBlue']!['c700']!,
    'totalCategoryVegetables': MyColors.primary['KiduBlue']!['c300']!,
    'totalCategoryMeats': MyColors.primary['KiduBlue']!['c100']!,
    'totalCategorySauces': MyColors.secondary['DawnOrange']!['c700']!,
    'totalCategoryFruits': MyColors.primary['KiduBlue']!['c500']!,
    'totalCategoryBread': MyColors.primary['CulturalYellow']!['c800']!,
    'totalCategorySpices': MyColors.primary['CulturalYellow']!['c100']!,
    'totalCategorySeafood': MyColors.primary['CulturalYellow']!['c500']!,
    'totalCategoryDairy_products': MyColors.secondary['DawnOrange']!['c300']!,
    'totalCategoryAlcohol': MyColors.primary['KiduBlue']!['c300']!,
    'totalCategoryDishes': MyColors.secondary['AspiringViolet']!['c300']!,
    'totalCategoryCereals': MyColors.secondary['AspiringViolet']!['c700']!,
    'totalCategoryNuts': MyColors.support['Error']!['c900']!,
    'totalCategoryEtc': MyColors.support['Error']!['c400']!,
  };
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        setState(() {
          firstDay = DateTime.parse(arguments['firstDay']);
          lastDay = DateTime.parse(arguments['lastDay']);
        });
      }
    });
    getTotalCategory();
  }

  void _onChangeFocus() {
    setState(() {
      _isFocus = !_isFocus;
    });
  }

  void getTotalCategory() async {
    // Loading.showLoading();
    setState(() {
      isLoad = true;
    });
    await CategoryService()
        .getTotalCategory(
            firstDay: firstDay,
            lastDay: lastDay,
            fridgeId: Provider.of<UserProvider>(context, listen: false)
                .user!
                .fridgeId!,
            sort: sort)
        .then((value) => setState(() {
              totalCategory = value;
              print('totalCategory: $totalCategory');
            }));

    totalCategory.forEach((key, value) {
      mockDonut.add(ArcType(
        value: double.parse(value.toString()),
        color: colorMap[key],
        label: convertKeyToLabel(key),
      ));
      totalType++;
    });
    setState(() {
      isLoad = false;
    });
    // Loading.hideLoading();
  }

  String convertKeyToLabel(String key) {
    String prefixToRemove = 'totalCategory';
    String result = key.replaceFirst(prefixToRemove, '');
    String type = result[0].toLowerCase() + result.substring(1);
    String label = foods.firstWhere((element) => element.value == type).label;
    return label;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white['c900'],
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  color: MyColors.white["c900"]!,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  MyText(
                                    text: 'Dữ liệu',
                                    fontSize: FontSize.z14,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.grey['c500']!,
                                    lineHeight: 1.43,
                                    textAlign: TextAlign.center,
                                  ),
                                  MyText(
                                      text: "Sử dụng thực phẩm",
                                      decoration: TextDecoration.none,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: MyColors.grey["c800"]!),
                                ],
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    const MyDivider(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const MyDivider(),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                MyText(
                                  text: 'Ngày sử dụng',
                                  fontSize: FontSize.z15,
                                  fontWeight: FontWeight.w700,
                                  color: MyColors.grey['c600']!,
                                  lineHeight: 1.2,
                                  letterSpacing: -0.15,
                                  textAlign: TextAlign.center,
                                ),
                                Flexible(
                                  child: MyButtonFeature(
                                    isFocused: _isFocus,
                                    buttonType: ButtonType.yellow,
                                    text:
                                        '${formatterPeriod.format(firstDay)} - ${formatterPeriod.format(lastDay)}',
                                    endIcon:
                                        'assets/icons/i16/dropdown-down-white.png',
                                    sizeEndIcon: const Size(16, 16),
                                    fontSize: FontSize.z13,
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) => CalendarPicker(
                                          title: 'Select transaction date',
                                          minDate: DateTime(2001),
                                          maxDate: DateTime.now(),
                                          selectedRange: DateTimeRange(
                                            start: firstDay,
                                            end: lastDay,
                                          ),
                                          initialPickerType: PickerType.days,
                                          onSubmit: (selectedDate) {
                                            setState(() {
                                              if (selectedDate.start != null) {
                                                firstDay = selectedDate.start!;
                                              }
                                              if (selectedDate.end != null) {
                                                lastDay = selectedDate.end!;
                                              }
                                              mockDonut.clear();
                                              totalType = 0;
                                              getTotalCategory();
                                            });
                                          },
                                        ),
                                      ).whenComplete(
                                        () => setState(
                                          () {
                                            _isFocus = false;
                                          },
                                        ),
                                      );
                                      _onChangeFocus();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 32),
                    color: MyColors.primary['CulturalYellow']?['c50'],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 18, 10, 26),
                              decoration: BoxDecoration(
                                color: MyColors.white['c900'],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CardHeader(
                                    title: 'Thực phẩm',
                                    visibleDivider: true,
                                    rightAction: PopupMenuButton(
                                      itemBuilder: (context) => [
                                        PopupMenuItem(
                                          value: 1,
                                          onTap: () {
                                            setState(() {
                                              sort = 'asc';
                                              mockDonut.clear();
                                              totalType = 0;
                                              getTotalCategory();
                                            });
                                          },
                                          child: Text('Tăng dần'),
                                        ),
                                        PopupMenuItem(
                                          value: 2,
                                          onTap: () {
                                            setState(() {
                                              sort = 'desc';
                                              mockDonut.clear();
                                              totalType = 0;
                                              getTotalCategory();
                                            });
                                          },
                                          child: Text('Giảm dần'),
                                        ),
                                        PopupMenuItem(
                                          value: 3,
                                          onTap: () {
                                            setState(() {
                                              sort = null;
                                              mockDonut.clear();
                                              totalType = 0;
                                              getTotalCategory();
                                            });
                                          },
                                          child: Text('Mặc định'),
                                        )
                                      ],
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MyText(
                                            text: sort == null
                                                ? 'Sắp xếp'
                                                : sort == 'asc'
                                                    ? 'Tăng dần'
                                                    : 'Giảm dần',
                                            fontSize: FontSize.z15,
                                            fontWeight: FontWeight.w500,
                                            color: MyColors.grey['c600']!,
                                          ),
                                          SizedBox(width: 10),
                                          Icon(Icons.arrow_drop_down,
                                              size: 25,
                                              color: MyColors.grey['c900']!),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 18),
                                  mockDonut.isEmpty
                                      ? chartLoading()
                                      : DonutChart(
                                        arcList: mockDonut,
                                        centerContent: Center(
                                          child: Wrap(
                                            direction: Axis.vertical,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            spacing: 1,
                                            children: [
                                              MyText(
                                                text: 'Tổng cộng',
                                                textAlign:
                                                    TextAlign.center,
                                                fontSize: FontSize.z14,
                                                fontWeight:
                                                    FontWeight.w600,
                                                color: MyColors
                                                    .grey['c600']!,
                                                lineHeight:
                                                    20 / FontSize.z14,
                                              ),
                                              MyText(
                                                text: '$totalType',
                                                textAlign:
                                                    TextAlign.center,
                                                fontSize: FontSize.z26,
                                                fontWeight:
                                                    FontWeight.w700,
                                                color: MyColors.primary[
                                                    'KiduBlue']!['c700']!,
                                                lineHeight:
                                                    32 / FontSize.z26,
                                                letterSpacing: -0.78,
                                              ),
                                              MyText(
                                                text: 'loại',
                                                textAlign:
                                                    TextAlign.center,
                                                fontSize: FontSize.z14,
                                                fontWeight:
                                                    FontWeight.w600,
                                                color: MyColors
                                                    .grey['c500']!,
                                                lineHeight:
                                                    18 / FontSize.z13,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                ],
                              ),
                            ),
                            SizedBox(height: 12),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  chartLoading() {
    final List<ArcType> mockDonut = [
      ArcType(
        value: 0,
        color: MyColors.primary['KiduBlue']!['c700']!,
        label: 'Trái cây',
      ),
      ArcType(
        value: 0,
        color: MyColors.primary['KiduBlue']!['c300']!,
        label: 'Rau',
      ),
      ArcType(
        value: 0,
        color: MyColors.primary['CulturalYellow']!['c700']!,
        label: 'Thịt',
      ),
      ArcType(
        value: 0,
        color: MyColors.primary['CulturalYellow']!['c200']!,
        label: 'Sản phẩm từ sữa',
      ),
      ArcType(
        value: 0,
        color: MyColors.secondary['DawnOrange']!['c700']!,
        label: 'Đồ uống',
      ),
      ArcType(
        value: 0,
        color: MyColors.secondary['AspiringViolet']!['c700']!,
        label: 'Khác',
      ),
    ];
    double totalOutgoing = mockDonut.fold(
      0,
      (previousValue, element) => previousValue + element.value,
    );
    return Column(
      children: [
        !isLoad ? chartEmpty() : Container(),
        !isLoad ? const SizedBox(height: 12,) : Container(),
        DonutChart(
          arcList: mockDonut,
          centerContent: Center(
            child: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 1,
              children: [
                MyText(
                  text: 'Tổng cộng',
                  textAlign: TextAlign.center,
                  fontSize: FontSize.z14,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c600']!,
                  lineHeight: 20 / FontSize.z14,
                ),
                MyText(
                  text: FunctionCore.convertMoneyFormat(
                    totalOutgoing,
                    Format.real,
                  ),
                  textAlign: TextAlign.center,
                  fontSize: FontSize.z26,
                  fontWeight: FontWeight.w700,
                  color: MyColors.primary['KiduBlue']!['c700']!,
                  lineHeight: 32 / FontSize.z26,
                  letterSpacing: -0.78,
                ),
                MyText(
                  text: 'loại',
                  textAlign: TextAlign.center,
                  fontSize: FontSize.z14,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c500']!,
                  lineHeight: 18 / FontSize.z13,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  chartEmpty() {
    return Center(
      child: MyText(
        text: 'Không có dữ liệu',
        fontSize: FontSize.z16,
        fontWeight: FontWeight.w600,
        color: MyColors.primary['KiduBlue']!['c700']!,
      ),
    );
  }
}
