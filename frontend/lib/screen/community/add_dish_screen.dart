import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/text.dart';
import 'package:frontend/widgets/text_field.dart';
import 'package:tiengviet/tiengviet.dart';

class AddDishScreen extends StatefulWidget {
  const AddDishScreen({super.key});

  @override
  State<AddDishScreen> createState() => _AddDishScreenState();
}

class _AddDishScreenState extends State<AddDishScreen> {
  List<String> listCategory = allCategories.map((e) => e.label).toList();
  int numberOfIngredients = 2;
  List<Widget> ingredientsList = [];
  int numberOfSteps = 2;
  List<String> stepsList = [];

  @override
  void initState() {
    super.initState();
    ingredientsList.addAll([
      _itemIngredient('100 ml', 'nước', onDelete: () {
        setState(() {
          numberOfIngredients--;
          ingredientsList.removeAt(0); // Xóa phần tử tại vị trí index
        });
      }),
      _itemIngredient('250 g', 'bột', onDelete: () {
        setState(() {
          numberOfIngredients--;
          ingredientsList.removeAt(1); // Xóa phần tử tại vị trí index
        });
      }),
    ]);
    stepsList.addAll([
      'Trộn bột và nước đến khi đặc lại',
      'Đậy kín hỗn hợp lại và để ở nhiệt độ thường'
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
            onPressed: () {},
            width: 70,
            height: 38,
            buttonType: ButtonType.disable,
          ),
          const SizedBox(width: 8),
          MyButton(
            text: 'Lên sóng',
            onPressed: () {},
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
                const SizedBox(height: 20),
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
    return SizedBox(
      width: double.infinity,
      child: Column(children: [
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
            onChange: (value) {},
            controller: null),
        const SizedBox(height: 10),
        MyTextField(
            obscureText: false,
            hasError: false,
            multipleLine: true,
            hintText:
                'Hãy chia sẻ với mọi người về món này của bạn nhé. Ai hay điều gì đã truyền cảm hứng cho bạn nấu nó? Tại sao nó đặc biệt? Bạn thích thưởng thức nó theo cách nào?',
            fontSize: FontSize.z17,
            onChange: (value) {},
            controller: null),
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
                hintText: '2 người',
                fontSize: FontSize.z17,
                onChange: (value) {},
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
                onChange: (value) {},
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
                final Widget item = ingredientsList.removeAt(oldIndex);
                ingredientsList.insert(newIndex, item);
              });
            },
            children: <Widget>[
              for (var ingredient in ingredientsList)
                Container(key: ValueKey(ingredient), child: ingredient),
            ],
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              setState(() {
                numberOfIngredients++;
                numberOfIngredients % 2 == 0
                    ? ingredientsList
                        .add(_itemIngredient('250 g', 'bột', onDelete: () {
                        setState(() {
                          numberOfIngredients--;
                          ingredientsList.removeAt(
                              numberOfIngredients); // Xóa phần tử tại vị trí index
                        });
                      }))
                    : ingredientsList
                        .add(_itemIngredient('100 ml', 'nước', onDelete: () {
                        setState(() {
                          numberOfIngredients--;
                          ingredientsList.removeAt(
                              numberOfIngredients); // Xóa phần tử tại vị trí index
                        });
                      }));
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

  Widget _itemIngredient(String hintText1, String hintText2,
      {VoidCallback? onDelete}) {
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
            onDelete!();
          },
        ),
        const SizedBox(width: 10),
        MyTextField(
          width: 100,
          obscureText: false,
          hasError: false,
          hintFontWeight: FontWeight.w600,
          labelColor: MyColors.grey['c700']!,
          hintText: hintText1,
          onChange: (value) {},
        ),
        Expanded(
            child: Autocomplete<ItemCategory>(
                displayStringForOption: (option) => option.label,
                fieldViewBuilder:
                    (context, controller, focusNode, onEditingComplete) {
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
                        hintText: hintText2,
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
                                  itemBuilder: (context, index) {
                                    final option = options.elementAt(index);
                                    return GestureDetector(
                                      onTap: () => onSelected(option),
                                      child: ListTile(
                                        title: Text(option.label),
                                        leading: Image.asset(
                                          option.icon,
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
                    return const Iterable<ItemCategory>.empty();
                  }
                  return allCategories.where((element) =>
                      TiengViet.parse(element.label)
                          .contains(TiengViet.parse(textEditingValue.text)));
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
                final String item = stepsList.removeAt(oldIndex);
                stepsList.insert(newIndex, item);
              });
            },
            children: <Widget>[
              ...stepsList.asMap().entries.map((entry) {
                final int index = entry.key;
                final String hintText = entry.value;
                return Container(
                    key: Key('$index'), child: _itemStep(hintText, index));
              }).toList(),
            ],
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              setState(() {
                numberOfSteps++;
                numberOfSteps % 2 != 0
                    ? stepsList.add('Trộn bột và nước đến khi đặc lại')
                    : stepsList.add('Đậy kín hỗn hợp và để ở nhiệt độ thường');
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

  Widget _itemStep(String hintText, int index) {
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
                  hintText: hintText,
                  obscureText: false,
                  hasError: false,
                  hintMaxLines: 1,
                  multipleLine: true,
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                  decoration: BoxDecoration(
                    color: MyColors.grey['c50']!,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset('assets/icons/i16/camera.png',
                      width: 24, height: 24, color: MyColors.grey['c400']!),
                )
              ],
            )),
            const SizedBox(width: 10),
            Icon(Icons.menu, color: MyColors.grey['c400']!)
          ]),
    );
  }
}
