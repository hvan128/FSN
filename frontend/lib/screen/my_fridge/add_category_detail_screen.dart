import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/food.dart';
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

class AddCategoryDetailScreen extends StatefulWidget {
  final Category? category;

  const AddCategoryDetailScreen({super.key, this.category});

  @override
  State<AddCategoryDetailScreen> createState() =>
      _AddCategoryDetailScreenState();
}

class _AddCategoryDetailScreenState extends State<AddCategoryDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Item>? listUnits;
  final List<Item> listPositions = [
    Item(
      label: "Tủ lạnh",
      value: 'cool',
    ),
    Item(
      label: "Tủ đông",
      value: 'freeze',
    ),
    Item(
      label: "Bếp",
      value: 'kitchen',
    ),
    Item(
      label: "Khác",
      value: 'other',
    )
  ];
  final List<Item> listSubPositions = [
    Item(
      label: "Không có",
      value: 'none',
    ),
  ];
  int quantity = 1;
  String position = 'cool';
  @override
  void initState() {
    super.initState();
    _controller.text = widget.category!.label;
    quantity = 1;
    listUnits = FunctionCore.getUnitList(widget.category!.type);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final type = foods
        .firstWhere((element) => element.value == widget.category?.type)
        .label;
    return Scaffold(
        backgroundColor: MyColors.primary['CulturalYellow']!['c50']!,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SafeArea(
              child: Column(children: [
            MyHeader(
              title: "Add Category",
              bgColor: MyColors.white['c900']!,
            ),
            Expanded(
                child: SingleChildScrollView(
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
                                        widget.category!.icon,
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
                                  child:
                                      MyButton(text: 'Thêm', onPressed: () {}),
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
              items: listUnits ?? [Item(value: 'piece', label: 'Cái')])),
      const SizedBox(
        height: 20,
      ),
      InputForm(
          label: 'Vị trí', content: MyDropDownButton(items: listPositions)),
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
            onTapOtherAction: () {
            },
          )),
      const SizedBox(
        height: 20,
      ),
      InputForm(
        label: 'Ngày nhập',
        content: MyDatePicker(
          label: 'Date of birth',
          onDateSelected: (DateTime date) {
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
          onDateSelected: (DateTime date) {
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
      )
    ]);
  }
}
