import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/modals/alert_modal.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/screens/my_fridge/choose_icon_screen.dart';
import 'package:frontend/screens/my_fridge/choose_type_screen.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/date_picker.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/drop-down.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/input-form.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';

class PreservationCategoryScreen extends StatefulWidget {
  const PreservationCategoryScreen({super.key});

  @override
  State<PreservationCategoryScreen> createState() =>
      _PreservationCategoryScreenState();
}

class _PreservationCategoryScreenState
    extends State<PreservationCategoryScreen> {
  List<Category> categories = [];
  Map<int, String?> helperText = {};
  Map<int, String> label = {};
  Map<int, DateTime> expDate = {};
  Map<int, int> positionId = {};
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final arguments = ModalRoute.of(context)?.settings.arguments as Map;
      setState(() {
        categories = arguments['categories'] as List<Category>;
        for (var element in categories) {
          helperText[element.id!] = '';
          label[element.id!] = element.type == null
              ? 'Chọn loại (bắt buộc)'
              : foods.firstWhere((e) => e.value == element.type).label;
          expDate[element.id!] =
              DateTime.now().add(Duration(days: element.defaultDuration!));
          positionId[element.id!] = 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Column(children: [
            MyHeader(
              title: 'Thêm thức ăn',
              bgColor: MyColors.white['c900']!,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    children: [
                      ...categories
                          .map((e) => Column(
                                children: [
                                  form(categories.indexOf(e)),
                                  const SizedBox(height: 10),
                                  const MyDivider(),
                                  const SizedBox(height: 10),
                                ],
                              ))
                          .toList(),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: MyButton(
                            text: 'Thêm',
                            onPressed: () {
                              onPressAdd();
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget form(int index) {
    setState(() {
      categories[index].manufactureDate = DateTime.now();
    });
    TextEditingController _controller =
        TextEditingController(text: categories[index].label);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: MyColors.grey['c100']!,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(children: [
            GestureDetector(
              onTap: () {
                chooseIcon(index);
              },
              child: Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: MyColors.primary['CulturalYellow']!['c100']!,
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
                    categories[index].icon ??
                        'assets/icons/i16/image-default.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 2),
                          decoration: BoxDecoration(
                            color: MyColors.primary['CulturalYellow']!['c800']!,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: MyColors
                                    .primary['CulturalYellow']!['c800']!,
                                blurRadius: 4,
                                offset: const Offset(1, 2),
                              )
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              chooseType(index);
                            },
                            child: MyText(
                              text: label[categories[index].id]!,
                              fontSize: FontSize.z16,
                              fontWeight: FontWeight.w500,
                              color: MyColors.white['c900']!,
                            ),
                          ),
                        ),
                        helperText[categories[index].id] != ''
                            ? const SizedBox(height: 5)
                            : Container(),
                        helperText[categories[index].id] != '' &&
                                helperText[categories[index].id] != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: MyText(
                                  text: helperText[categories[index].id]!,
                                  fontSize: FontSize.z12,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.support['Error']!['c900']!,
                                ),
                              )
                            : Container(),
                      ],
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
                            const EdgeInsets.symmetric(horizontal: 8),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey['c500']!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color:
                                  MyColors.primary['CulturalYellow']!['c600']!),
                        ),
                      ),
                    ),
                  ]),
            )
          ]),
          const SizedBox(
            height: 20,
          ),
          InputForm(
              label: 'Vị trí',
              content: MyDropDownButton(
                items: listPositions,
                onSelected: (value) => setState(() {
                  positionId[categories[index].id!] = int.parse(value!);
                }),
              )),
          const SizedBox(
            height: 20,
          ),
          InputForm(
            label: 'Ngày hết hạn',
            content: MyDatePicker(
              label: 'Date of birth',
              defaultValue: expDate[categories[index].id!],
              onDateSelected: (DateTime date) {
                setState(() {
                  expDate[categories[index].id!] = date;
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  void chooseType(int index) async {
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const ChooseTypeScreen();
    }));
    if (result != null) {
      setState(() {
        categories[index].type = result.value;
        label[categories[index].id!] = result.label;
        helperText[categories[index].id!] = null;
      });
    }
  }

  void chooseIcon(int index) async {
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ChooseIconScreen(
        type: categories[index].type,
      );
    }));
    if (result != null) {
      setState(() {
        categories[index].icon = result;
      });
    }
  }

  void onPressAdd() async {
    for (int i = 0; i < categories.length; i++) {
      if (categories[i].type == null) {
        setState(() {
          helperText[categories[i].id!] = 'Vui lòng chọn loại thức ăn!';
        });
      } else {
        setState(() {
          helperText.remove(categories[i].id);
        });
      }
    }
    if (helperText.isEmpty) {
      for (int i = 0; i < categories.length; i++) {
        final fridgeId = Provider.of<UserProvider>(
                Navigate().navigationKey.currentContext!,
                listen: false)
            .user!
            .fridgeId;
        await ApiService.put(Config.CATEGORIES_API, {
          'id': categories[i].id,
          'label': categories[i].label,
          'value': categories[i].value,
          'icon': categories[i].icon,
          'type': categories[i].type,
          'quantity': '1',
          'positionId': positionId[categories[i].id!],
          'manufactureDate': categories[i].manufactureDate!.toIso8601String(),
          'expiryDate': expDate[categories[i].id!]!.toIso8601String(),
          'fridgeId': fridgeId
        });
      }

      await APICacheManager().deleteCache('categories');
      await APICacheManager().deleteCache('categories_0');
      await APICacheManager().deleteCache('categories_1');
      await APICacheManager().deleteCache('categories_2');
      await APICacheManager().deleteCache('categories_3');

      Navigator.pop(context, true);
      showDialog(
          context: context,
          builder: (context) {
            return MyAlert(
              alertType: AlertType.success,
              position: AlertPosition.topCenter,
              title: 'Thành công',
              description:
                  'Thêm ${categories.length} đồ ăn vào tủ lạnh thành công!',
            );
          });
    }
  }
}
