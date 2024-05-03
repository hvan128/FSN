import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/components/community/image_picker.dart';
import 'package:frontend/components/modals/alert_modal.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/navigation/router/account.dart';
import 'package:frontend/navigation/router/community.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/services/community/dish_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/text.dart';
import 'package:frontend/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:tiengviet/tiengviet.dart';

class AddDishScreen extends StatefulWidget {
  const AddDishScreen({super.key});

  @override
  State<AddDishScreen> createState() => _AddDishScreenState();
}

class _AddDishScreenState extends State<AddDishScreen> {
  List<Ingredient> ingredientsList = [];
  List<StepModel> listStepsModel = [];
  String? selectedImagePath;

  final TextEditingController _labelController = TextEditingController();
  final TextEditingController _rangeOfPeopleController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _cookingTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ingredientsList.addAll([
      Ingredient(),
      Ingredient(),
    ]);
    listStepsModel.addAll([
      StepModel(),
      StepModel(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MyIconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset('assets/icons/i16/back.png',
              width: 25, height: 25, color: MyColors.grey['c900']!),
        ),
        actions: [
          MyButton(
            text: 'Lưu',
            onPressed: onSaveDish,
            width: 70,
            height: 38,
            buttonType: ButtonType.disable,
          ),
          const SizedBox(width: 8),
          MyButton(
            text: 'Lên sóng',
            onPressed: onAddDish,
            width: 110,
            height: 38,
            buttonType: ButtonType.yellow,
          ),
          const SizedBox(width: 15),
          MyIconButton(
              icon: Image.asset('assets/icons/i16/dots-horizontal.png',
                  width: 25, height: 25, color: MyColors.grey['c900']!),
              onPressed: () {}),
          const SizedBox(width: 15),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
            color: MyColors.primary['CulturalYellow']!['c50']!,
            child: SingleChildScrollView(
              child: Column(children: [
                _uploadImage(),
                const SizedBox(height: 20),
                _buildFormInfo(),
                const SizedBox(height: 8),
                _buildFormIngredient(),
                const SizedBox(height: 8),
                _buildFormStep(),
                const SizedBox(
                  height: 36,
                ),
              ]),
            )),
      ),
    );
  }

  Widget _uploadImage() {
    return selectedImagePath != null
        ? imagePreview()
        : GestureDetector(
            onTap: () {
              pickerImage((path) => setState(() {
                    selectedImagePath = path;
                  }));
            },
            child: SizedBox(
              width: double.infinity,
              child: Column(children: [
                const SizedBox(height: 20),
                Image.asset('assets/images/new-food.png',
                    width: 150, color: MyColors.grey['c900']!),
                const SizedBox(height: 10),
                MyText(
                  text: 'Đăng tải hình đại diện món ăn',
                  fontSize: FontSize.z20,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c700']!,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                MyText(
                  text: 'Hãy truyền cảm hứng nấu món này tới mọi người',
                  fontSize: FontSize.z15,
                  fontWeight: FontWeight.w400,
                  color: MyColors.grey['c600']!,
                ),
              ]),
            ),
          );
  }

  Widget _buildFormInfo() {
    return Container(
      color: MyColors.white['c900']!,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(children: [
        MyTextField(
            obscureText: false,
            hasError: false,
            hintText: 'Tên món: Món canh bí ngon nhất',
            fontSize: FontSize.z20,
            hintFontWeight: FontWeight.w600,
            onChange: (value) {
              _labelController.text = value;
            },
            controller: _labelController),
        const SizedBox(height: 10),
        MyTextField(
            obscureText: false,
            hasError: false,
            multipleLine: true,
            hintText:
                'Hãy chia sẻ với mọi người về món này của bạn nhé. Ai hay điều gì đã truyền cảm hứng cho bạn nấu nó? Tại sao nó đặc biệt? Bạn thích thưởng thức nó theo cách nào?',
            fontSize: FontSize.z17,
            onChange: (value) {
              _descriptionController.text = value;
            },
            controller: _descriptionController),
        const SizedBox(height: 10),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              MyText(
                text: 'Khẩu phần',
                fontSize: FontSize.z17,
                fontWeight: FontWeight.w400,
                color: MyColors.grey['c600']!,
              ),
              MyTextField(
                width: 175,
                obscureText: false,
                hasError: false,
                controller: _rangeOfPeopleController,
                hintText: '2 người',
                fontSize: FontSize.z17,
                onChange: (value) {
                  _rangeOfPeopleController.text = value;
                },
              )
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              MyText(
                text: 'Thời gian nấu',
                fontSize: FontSize.z17,
                fontWeight: FontWeight.w400,
                color: MyColors.grey['c600']!,
              ),
              MyTextField(
                width: 175,
                obscureText: false,
                hasError: false,
                hintText: '1 tiếng 30 phút',
                fontSize: FontSize.z17,
                controller: _cookingTimeController,
                onChange: (value) {
                  _cookingTimeController.text = value;
                },
              )
            ])
      ]),
    );
  }

  Widget _buildFormIngredient() {
    return Container(
      color: MyColors.white['c900']!,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: 'Nguyên liệu',
            fontSize: FontSize.z20,
            fontWeight: FontWeight.w600,
            color: MyColors.grey['c800']!,
          ),
          ReorderableListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final Ingredient item = ingredientsList.removeAt(oldIndex);
                ingredientsList.insert(newIndex, item);
              });
            },
            children: <Widget>[
              ...ingredientsList.asMap().entries.map((entry) {
                final int index = entry.key;
                return Container(
                    key: Key('$index'), child: _itemIngredient(index));
              }).toList(),
            ],
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              setState(() {
                ingredientsList.add(Ingredient());
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/i16/add.png',
                  width: 16,
                  height: 16,
                  color: MyColors.grey['c700']!,
                ),
                const SizedBox(width: 10),
                MyText(
                  text: 'Nguyên liệu',
                  fontSize: FontSize.z17,
                  fontWeight: FontWeight.w500,
                  color: MyColors.grey['c700']!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemIngredient(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        MyIconButton(
          icon: Image.asset(
            'assets/icons/i16/dots-horizontal.png',
            width: 24,
            height: 24,
            color: MyColors.grey['c300'],
          ),
          onPressed: () {
            setState(() {
              ingredientsList.removeAt(index);
            });
          },
        ),
        const SizedBox(width: 10),
        MyTextField(
          width: 100,
          obscureText: false,
          hasError: false,
          hintFontWeight: FontWeight.w600,
          labelColor: MyColors.grey['c700']!,
          hintText: index % 2 == 0 ? '100g' : '200ml',
          controller: TextEditingController(
              text: ingredientsList[index].quantity != null &&
                      ingredientsList[index].unit != null
                  ? '${ingredientsList[index].quantity} ${ingredientsList[index].unit}'
                  : null),
          onChange: (value) {
            var input = FunctionCore().parseInput(value);
            ingredientsList[index].quantity =
                input['quantity'] != null ? int.tryParse(input['quantity']) : 0;
            ingredientsList[index].unit = input['unit'];
          },
        ),
        Expanded(
            child: Autocomplete<Category>(
                displayStringForOption: (option) => option.label!,
                fieldViewBuilder:
                    (context, controller, focusNode, onEditingComplete) {
                  final text = allCategories
                      .firstWhere(
                          (element) =>
                              element.value == ingredientsList[index].category,
                          orElse: () => Category())
                      .label;
                  controller.text = text ?? '';
                  return TextField(
                      minLines: 1,
                      maxLines: 10,
                      cursorColor: MyColors.primary['CulturalYellow']!['c700']!,
                      controller: controller,
                      focusNode: focusNode,
                      onEditingComplete: onEditingComplete,
                      style: TextStyle(
                          color: MyColors.grey['c600']!,
                          fontSize: FontSize.z16,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        hintMaxLines: 10,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey['c200']!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey['c200']!),
                        ),
                        hintText: index % 2 == 0 ? "bột" : "nước",
                        hintStyle: TextStyle(
                            color: MyColors.grey['c300']!,
                            fontSize: FontSize.z16,
                            fontWeight: FontWeight.w400),
                      ));
                },
                optionsViewBuilder: (context, onSelected, options) {
                  return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                          elevation: 4.0,
                          child: SizedBox(
                              width: 225,
                              height: 225,
                              child: ListView.builder(
                                  itemCount: options.length,
                                  itemBuilder: (context, i) {
                                    final option = options.elementAt(i);
                                    return GestureDetector(
                                      onTap: () {
                                        onSelected(option);
                                        ingredientsList[index].category =
                                            option.value;
                                      },
                                      child: ListTile(
                                        title: Text(option.label!),
                                        leading: Image.asset(
                                          option.icon!,
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }))));
                },
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<Category>.empty();
                  }
                  return allCategories.where((element) =>
                      TiengViet.parse(element.label!).toLowerCase().contains(
                          TiengViet.parse(textEditingValue.text)
                              .toLowerCase()));
                })),
        const SizedBox(width: 10),
        Icon(Icons.menu, color: MyColors.grey['c400']!)
      ]),
    );
  }

  void chooseIngredient() {
    print('back');
  }

  Widget _buildFormStep() {
    return Container(
      color: MyColors.white['c900']!,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: 'Cách làm',
            fontSize: FontSize.z20,
            fontWeight: FontWeight.w600,
            color: MyColors.grey['c800']!,
          ),
          const SizedBox(height: 20),
          ReorderableListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final StepModel item = listStepsModel.removeAt(oldIndex);
                listStepsModel.insert(newIndex, item);
              });
            },
            children: <Widget>[
              ...listStepsModel.asMap().entries.map((entry) {
                final int index = entry.key;
                return Container(key: Key('$index'), child: _itemStep(index));
              }).toList(),
            ],
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              setState(() {
                listStepsModel.add(StepModel());
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/i16/add.png',
                  width: 16,
                  height: 16,
                  color: MyColors.grey['c700']!,
                ),
                const SizedBox(width: 10),
                MyText(
                  text: 'Thêm bước',
                  fontSize: FontSize.z17,
                  fontWeight: FontWeight.w500,
                  color: MyColors.grey['c700']!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemStep(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: MyColors.grey['c700']!,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: MyText(
                  text: '${index + 1}',
                  fontSize: FontSize.z15,
                  fontWeight: FontWeight.w600,
                  color: MyColors.white['c900']!,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextField(
                  hintText: index % 2 == 0
                      ? 'Trộn bột và nước đến khi đặc lại'
                      : 'Đậy kín hỗn hợp lại và để ở nhiệt độ thường',
                  controller: TextEditingController(
                      text: listStepsModel[index].description),
                  onChange: (p0) {
                    listStepsModel[index].description = p0;
                  },
                  value: listStepsModel[index].description != null
                      ? listStepsModel[index].description!
                      : '',
                  obscureText: false,
                  hasError: false,
                  hintMaxLines: 1,
                  multipleLine: true,
                ),
                const SizedBox(height: 10),
                listStepsModel[index].image == null
                    ? GestureDetector(
                        onTap: () {
                          pickerImage((imagePath) {
                            setState(() {
                              listStepsModel[index].image = imagePath;
                            });
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 25),
                          decoration: BoxDecoration(
                            color: MyColors.grey['c50']!,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Image.asset('assets/icons/i16/camera.png',
                              width: 24,
                              height: 24,
                              color: MyColors.grey['c400']!),
                        ),
                      )
                    : Image.file(
                        File(listStepsModel[index].image!),
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
              ],
            )),
            const SizedBox(width: 10),
            Icon(Icons.menu, color: MyColors.grey['c400']!)
          ]),
    );
  }

  void pickerImage(Function(String) onImageSelected) {
    showDialog(
        context: context,
        builder: (context) => MyImagePicker(onImageSelected: onImageSelected));
  }

  imagePreview() {
    return Image.file(
      File(selectedImagePath!),
      width: double.infinity,
      height: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }

  void onAddDish() async {
    for (var i = 0; i < listStepsModel.length; i++) {
      listStepsModel[i].no = i + 1;
    }
    final userId = Provider.of<UserProvider>(context, listen: false).user!.id;
    final Dish dish = Dish(
      label: _labelController.text,
      description: _descriptionController.text,
      image: selectedImagePath,
      rangOfPeople: _rangeOfPeopleController.text,
      steps: listStepsModel,
      ingredients: ingredientsList,
      cookingTime: _cookingTimeController.text,
      ownerId: userId,
    );

    final response = await DishService.addDish(dish);
    if (response) {
      Navigate.pop();
      Navigate.pop();
      showDialog(
          context: context,
          builder: (context) => const MyAlert(
                alertType: AlertType.success,
                title: 'Thành công',
                description:
                    'Thêm món ăn thành công! Hãy chia sẽ chúng với bạn bè và người thân nhé.',
              ));
    } else {
      print('add dish fail');
    }
  }

  void onSaveDish() async {}
}
