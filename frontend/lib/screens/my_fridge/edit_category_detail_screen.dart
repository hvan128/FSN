import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/modals/alert_modal.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/category/category_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/date_picker.dart';
import 'package:frontend/widgets/drop-down.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/input-form.dart';
import 'package:frontend/widgets/text.dart';
import 'package:frontend/widgets/text_area.dart';
import 'package:provider/provider.dart';

class EditCategoryDetailScreen extends StatefulWidget {
  const EditCategoryDetailScreen({super.key});

  @override
  State<EditCategoryDetailScreen> createState() =>
      _EditCategoryDetailScreenState();
}

class _EditCategoryDetailScreenState extends State<EditCategoryDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Item>? listUnits;
  final List<Item> listPositions = [
    Item(
      label: "Tủ lạnh",
      value: '1',
    ),
    Item(
      label: "Tủ đông",
      value: '2',
    ),
    Item(
      label: "Bếp",
      value: '3',
    ),
    Item(
      label: "Khác",
      value: '4',
    )
  ];
  final List<Item> listSubPositions = [
    Item(
      label: "Không có",
      value: '0',
    ),
    Item(
      label: "Không có",
      value: '1',
    ),
  ];
  int? id;
  String? position;
  String? label;
  String? unit;
  String? type;
  String? subPosition;
  DateTime? expiryDate;
  DateTime? manufactureDate;
  int quantity = 1;
  Category? category;
  String? value;
  String? icon;
  String note = '';

  @override
  void initState() {
    super.initState();
    category = Category();

    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        setState(() {
          category = arguments['category'];
          id = category!.id;
          _controller.text = category!.label ?? '';
          icon = category!.icon ?? 'assets/icons/i16/logo.png';
          type = category!.type ?? '';
          position = '${category!.positionId}';
          label = category!.label ?? '';
          unit = category!.unit;
          value = category!.value;
          subPosition = '${category!.subPositionId}';
          manufactureDate = category!.manufactureDate;
          expiryDate = category!.expiryDate;
          quantity = category!.quantity ?? 1;
        });
      }
      setState(() {
        listUnits = FunctionCore.getUnitList(type ?? '');
      });
    });
  }

  String formatDate(DateTime date) {
    final str = date.toIso8601String();
    if (str.length != 24) {
      return str;
    }
    var newStr = '${str.substring(0, 10)} ${str.substring(11, 23)}';
    return newStr;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final type = foods
        .firstWhere((element) => element.value == category!.type,
            orElse: () => foods.first)
        .label;
    return Scaffold(
        backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SafeArea(
              child: Column(children: [
            MyHeader(
              title: "Chỉnh sửa đồ ăn",
              bgColor: MyColors.white['c900']!,
            ),
            Expanded(
                child: SingleChildScrollView(
                    // physics: const BouncingScrollPhysics(),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: MyColors.grey['c100']!,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(children: [
                                const SizedBox(
                                  height: 22,
                                ),
                                Row(children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: MyColors.primary[
                                            'CulturalYellow']!['c100']!,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: MyColors.grey['c300']!,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: MyColors.grey['c300']!,
                                            blurRadius: 2,
                                            offset: const Offset(1, 2),
                                          )
                                        ]),
                                    child: SizedBox(
                                      height: 60,
                                      width: 60,
                                      child: Image.asset(
                                        icon ?? 'assets/icons/i16/logo.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 80,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 2),
                                              decoration: BoxDecoration(
                                                color: MyColors.primary[
                                                    'CulturalYellow']!['c800']!,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: MyColors.primary[
                                                            'CulturalYellow']![
                                                        'c800']!,
                                                    blurRadius: 4,
                                                    offset: const Offset(1, 2),
                                                  )
                                                ],
                                              ),
                                              child: MyText(
                                                text: type,
                                                fontSize: FontSize.z16,
                                                fontWeight: FontWeight.w500,
                                                color: MyColors.white['c900']!,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            TextField(
                                              controller: _controller,
                                              onChanged: (value) {
                                                setState(() {
                                                  _controller.text = value;
                                                });
                                              },
                                              style: TextStyle(
                                                color: MyColors.grey['c900']!,
                                                fontSize: FontSize.z16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: MyColors
                                                          .grey['c500']!),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 2,
                                                      color: MyColors.primary[
                                                              'CulturalYellow']![
                                                          'c600']!),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                  )
                                ]),
                                const SizedBox(
                                  height: 20,
                                ),
                                _buildForm(),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: MyButton(
                                      text: 'Thêm',
                                      onPressed: () {
                                        onPressAdd();
                                      }),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ])),
                          const SizedBox(
                            height: 32,
                          )
                        ]))))
          ])),
        ));
  }

  Widget _buildForm() {
    return Column(children: [
      InputForm(
          label: 'Số lượng',
          content: Container(
            width: 110,
            decoration: BoxDecoration(
                color: MyColors.primary['CulturalYellow']!['c800']!,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: MyColors.grey['c300']!,
                    blurRadius: 4,
                    offset: const Offset(1, 2),
                  )
                ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: MyColors.primary['CulturalYellow']!['c100']!,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (quantity >= 1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                          icon: const Icon(Icons.remove, size: 15))),
                  MyText(
                      text: '$quantity',
                      fontSize: FontSize.z15,
                      fontWeight: FontWeight.w700,
                      color: MyColors.white['c900']!),
                  Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: MyColors.primary['CulturalYellow']!['c100']!,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: const Icon(Icons.add, size: 15))),
                ]),
          )),
      const SizedBox(
        height: 20,
      ),
      InputForm(
          label: 'Đơn vị',
          content: MyDropDownButton(
            items: listUnits ?? [Item(value: 'piece', label: 'Cái')],
            selectedValue: unit,
            onSelected: (value) => setState(() {
              unit = value;
            }),
          )),
      const SizedBox(
        height: 20,
      ),
      InputForm(
          label: 'Vị trí',
          content: MyDropDownButton(
            items: listPositions,
            selectedValue: position,
            onSelected: (value) => setState(() {
              position = value;
            }),
          )),
      const SizedBox(
        height: 20,
      ),
      InputForm(
          label: 'Vị trí con',
          content: MyDropDownButton(
              items: listSubPositions,
              selectedValue: subPosition,
              otherAction: Item(
                value: 'add',
                label: 'Tạo mới',
              ),
              onTapOtherAction: () {},
              onSelected: (value) => setState(() {
                    subPosition = value;
                  }))),
      const SizedBox(
        height: 20,
      ),
      manufactureDate == null
          ? Container()
          : InputForm(
              label: 'Ngày nhập',
              content: MyDatePicker(
                defaultValue: manufactureDate,
                onDateSelected: (DateTime date) {
                  setState(() {
                    manufactureDate = date;
                  });
                },
              ),
            ),
      const SizedBox(
        height: 20,
      ),
      expiryDate == null
          ? Container()
          : InputForm(
              label: 'Ngày hết hạn',
              content: MyDatePicker(
                label: 'Date of birth',
                defaultValue: expiryDate,
                onDateSelected: (DateTime date) {
                  setState(() {
                    expiryDate = date;
                  });
                },
              ),
            ),
      const SizedBox(
        height: 20,
      ),
      MyTextArea(
          hasError: false,
          label: 'Ghi chú',
          hintText: 'Nhấn để viết ghi nhớ',
          onChange: (value) {
            note = value;
          })
    ]);
  }

  void onPressAdd() async {
    final fridgeId = Provider.of<UserProvider>(
            Navigate().navigationKey.currentContext!,
            listen: false)
        .user!
        .fridgeId;
    ApiService.put(Config.CATEGORIES_API, {
      'id': id,
      'label': label,
      'value': value,
      'icon': icon,
      'type': type,
      'quantity': quantity,
      'unit': unit,
      'positionId': int.parse(position!),
      'subPositionId': int.parse(subPosition!),
      'manufactureDate': formatDate(manufactureDate!),
      'expiryDate': formatDate(expiryDate!),
      'fridgeId': fridgeId
    });
    await CategoryService().deleteCache();
    await APICacheManager().deleteCache('categories');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    showDialog(
        context: context,
        builder: (context) {
          return MyAlert(
            alertType: AlertType.success,
            position: AlertPosition.topCenter,
            title: 'Thành công',
            description:
                'Thêm đồ ăn ${category!.label} vào $position thành công!',
          );
        });
  }
}
