import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/text.dart';

class AddFoodScreen extends StatefulWidget {
  final String? type;

  const AddFoodScreen({super.key, this.type});

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final food = foods.firstWhere((element) => element.value == widget.type);

    return Scaffold(
        body: GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
          child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: Column(
          children: [
            MyHeader(
              title: 'Thức ăn mới',
              disableRightButton: true,
              bgColor: MyColors.white['c900']!,
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                    color: MyColors
                                        .primary['CulturalYellow']!['c100']!,
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
                                    food.icon,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: MyColors.primary[
                                                'CulturalYellow']!['c800']!,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: MyColors.primary[
                                                    'CulturalYellow']!['c800']!,
                                                blurRadius: 4,
                                                offset: const Offset(1, 2),
                                              )
                                            ],
                                          ),
                                          child: MyText(
                                            text: food.label,
                                            fontSize: FontSize.z16,
                                            fontWeight: FontWeight.w500,
                                            color: MyColors.white['c900']!,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextField(
                                          controller: _nameController,
                                          onChanged: (value) {
                                            setState(() {
                                              _nameController.text = value;
                                            });
                                          },
                                          style: TextStyle(
                                            color: MyColors.grey['c900']!,
                                            fontSize: FontSize.z16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Tên món ăn",
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      MyColors.grey['c500']!),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
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
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 14),
                                decoration: BoxDecoration(
                                  color: MyColors.white['c900']!,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    MyText(
                                      text:
                                          'Khoảng thời gian lưu trữ mặc định:  ',
                                      fontSize: FontSize.z14,
                                      fontWeight: FontWeight.w600,
                                      color: MyColors.grey['c900']!,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          width: 40,
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            controller: _dateController,
                                            onChanged: (value) {
                                              setState(() {
                                                _dateController.text = value;
                                              });
                                            },
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: FontSize.z14,
                                              fontWeight: FontWeight.w600,
                                              color: MyColors.grey['c900']!,
                                            ),
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    const UnderlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none),
                                                enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: MyColors.primary[
                                                                'CulturalYellow']![
                                                            'c600']!))),
                                          ),
                                        ),
                                        MyText(
                                            text: ' ngày.',
                                            fontSize: FontSize.z14,
                                            fontWeight: FontWeight.w600,
                                            color: MyColors.grey['c900']!)
                                      ],
                                    )
                                  ],
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: MyButton(text: 'Thêm', onPressed: () {}),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ])),
                      const SizedBox(
                        height: 32,
                      )
                    ])))
          ],
        ),
      )),
    ));
  }
}
