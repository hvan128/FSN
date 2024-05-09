import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/config.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/screens/my_fridge/choose_icon_screen.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';

class CreateNewCategoryScreen extends StatefulWidget {
  final String? type;

  const CreateNewCategoryScreen({super.key, this.type});

  @override
  State<CreateNewCategoryScreen> createState() => _CreateNewCategoryScreenState();
}

class _CreateNewCategoryScreenState extends State<CreateNewCategoryScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String? icon;

  @override
  void initState() {
    super.initState();
    icon = foods.firstWhere((element) => element.value == widget.type).icon;
  }

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
                              GestureDetector(
                                onTap: chooseIcon,
                                child: Container(
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
                                      icon ?? 'assets/icons/i16/image-default.png',
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
                              child: MyButton(text: 'Thêm', onPressed: createNewCategory),
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
 

  void createNewCategory() async {
    if (_nameController.text.isNotEmpty && _dateController.text.isNotEmpty) {
      String label = _nameController.text;
      int defaultDuration  = int.parse(_dateController.text);
      await ApiService.post('${Config.CATEGORIES_API}/new', {
        'label': label,
        'defaultDuration': defaultDuration,
        'value': FunctionCore.convertToSlug(label),
        'icon': icon,
        'type': widget.type,
        'fridgeId': Provider.of<UserProvider>(context, listen: false).user!.fridgeId
      });
      APICacheManager().deleteCache('categories_new');
      Navigator.pop(context);
    } else {
      FunctionCore.showSnackBar(context, 'Vui lý điền đầy đủ thông tin');
    }
  }

  void chooseIcon() async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ChooseIconScreen(
        type: widget.type!,
      );
    }));
    setState(() {
      icon = result;
    });
  }
}
