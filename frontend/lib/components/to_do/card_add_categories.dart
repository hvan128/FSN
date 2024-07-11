import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/modals/alert_modal.dart';
import 'package:frontend/components/modals/modal_select.dart';
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
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/date_picker.dart';
import 'package:frontend/widgets/drop-down.dart';
import 'package:frontend/widgets/input_form.dart';
import 'package:frontend/widgets/text.dart';
import 'package:frontend/widgets/text_area.dart';
import 'package:provider/provider.dart';

class CardAddCategory extends StatefulWidget {
  final Category category;
  const CardAddCategory({super.key, required this.category});

  @override
  State<CardAddCategory> createState() => _CardAddCategoryState();
}

class _CardAddCategoryState extends State<CardAddCategory> {
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
  ];
  String? position;
  String? unit;
  String? subPosition;
  DateTime? expDate;
  DateTime? manufactureDate;
  int quantity = 1;
  String note = '';
  String? type;
  String? labelType;
  String? icon;
  String? helperText;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.category.label!;
    listUnits = FunctionCore.getUnitList(widget.category.type);
    position = listPositions.first.value;
    unit = listUnits!.first.value;
    subPosition = listSubPositions.first.value;
    manufactureDate = DateTime.now();
    expDate = DateTime.now()
        .add(Duration(days: widget.category.defaultDuration ?? 1));
    type = widget.category.type;
    labelType = widget.category.type == null
        ? 'Chọn loại (bắt buộc)'
        : foods
            .firstWhere((element) => element.value == widget.category.type)
            .label;
    icon = widget.category.icon ?? 'assets/icons/i16/image-default.png';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: MyColors.grey['c100']!,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                const DragStick(),
                const SizedBox(
                  height: 16,
                ),
                MyText(
                  text: 'Thêm thực phẩm',
                  fontSize: FontSize.z20,
                  fontWeight: FontWeight.w700,
                  color: MyColors.grey['c900']!,
                ),
                const SizedBox(
                  height: 22,
                ),
                 Row(children: [
            GestureDetector(
              onTap: () {
                chooseIcon();
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
                    icon ??
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
                              chooseType();
                            },
                            child: MyText(
                              text: labelType!,
                              fontSize: FontSize.z16,
                              fontWeight: FontWeight.w500,
                              color: MyColors.white['c900']!,
                            ),
                          ),
                        ),
                        helperText != ''
                            ? const SizedBox(height: 5)
                            : Container(),
                        helperText != '' &&
                                helperText != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: MyText(
                                  text: helperText!,
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
                const SizedBox(
                  height: 20,
                ),
                _buildForm(),
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
              ])),
        ]),
      ),
    );
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
                            if (quantity > 1) {
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
      InputForm(
        label: 'Ngày nhập',
        content: MyDatePicker(
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
      InputForm(
        label: 'Ngày hết hạn',
        content: MyDatePicker(
          label: 'Date of birth',
          defaultValue: expDate,
          onDateSelected: (DateTime date) {
            setState(() {
              expDate = date;
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
    if (type == null) {
      setState(() {
        helperText = 'Vui lòng chọn loại thức ăn!';
      });
    } else {
      final fridgeId = Provider.of<UserProvider>(
              Navigate().navigationKey.currentContext!,
              listen: false)
          .user!
          .fridgeId;
      await ApiService.post(Config.CATEGORIES_API, {
        'label': widget.category.label,
        'value': widget.category.value,
        'icon': icon,
        'type': type,
        'quantity': quantity,
        'unit': unit,
        'positionId': int.parse(position!),
        'subPositionId': int.parse(subPosition!),
        'manufactureDate': manufactureDate!.toIso8601String(),
        'expiryDate': expDate!.toIso8601String(),
        'fridgeId': fridgeId
      });
      await APICacheManager().deleteCache('categories_${int.parse(position!)}');
      await APICacheManager().deleteCache('categories');
      Navigator.pop(context, true);
      showDialog(
          context: context,
          builder: (context) {
            return MyAlert(
              alertType: AlertType.success,
              position: AlertPosition.topCenter,
              title: 'Thành công',
              description:
                  'Thêm đồ ăn ${widget.category.label} vào $position thành công!',
            );
          });
    }
  }

  void chooseType() async {
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const ChooseTypeScreen();
    }));
    if (result != null) {
      setState(() {
        type = result.value;
        labelType = result.label;
        helperText = null;
        listUnits = FunctionCore.getUnitList(type);
      });
    }
  }

  void chooseIcon() async {
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ChooseIconScreen(
        type: type,
      );
    }));
    if (result != null) {
      setState(() {
        icon = result;
      });
    }
  }
}
