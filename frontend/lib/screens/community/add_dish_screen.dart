import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/components/community/image_picker.dart';
import 'package:frontend/components/modals/alert_modal.dart';
import 'package:frontend/components/modals/notification_modal.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/services/community/dish_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/button_icon.dart';
import 'package:frontend/widgets/image.dart';
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
  List<Ingredient> ingredientsList = [
    Ingredient(),
    Ingredient(),
  ];
  List<StepModel> listStepsModel = [
    StepModel(),
    StepModel(),
  ];
  String? selectedImagePath;
  String? type;
  String? dishType;
  Dish? dish;
  List<String> fileSelected = [];

  final TextEditingController _labelController = TextEditingController();
  final TextEditingController _rangeOfPeopleController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _cookingTimeController = TextEditingController();
  final labelErrorText = 'Vui lòng nhập tên món ăn';
  final rangeOfPeopleErrorText = 'Vui lòng nhập số người';
  final descriptionErrorText = 'Vui lòng nhập mô tả';
  final cookingTimeErrorText = 'Vui lòng nhập thời gian chế biến';
  final imageErrorText = 'Vui lòng chọn hình ảnh';
  final ingredientErrorText = 'Vui lòng thêm nguyên liệu';
  final stepErrorText = 'Vui lòng thêm bước làm';
  bool labelHasError = false;
  bool rangeOfPeopleHasError = false;
  bool descriptionHasError = false;
  bool cookingTimeHasError = false;
  bool imageHasError = false;
  bool ingredientHasError = false;
  bool stepHasError = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        final args = ModalRoute.of(context)!.settings.arguments as Map;
        setState(() {
          type = args['type'] ?? 'add';
          dish = args['dish'];
          dishType = args['dishType'] ?? 'recipes';
          if (dish != null) {
            _labelController.text = dish!.label ?? '';
            _rangeOfPeopleController.text = dish!.rangeOfPeople ?? '';
            _descriptionController.text = dish!.description ?? '';
            _cookingTimeController.text = dish!.cookingTime.toString();
            selectedImagePath = dish!.image;
            ingredientsList = dish!.ingredients ?? [];
            listStepsModel = dish!.steps ?? [];
          }
        });
      } else {
        ingredientsList.addAll([
          Ingredient(),
          Ingredient(),
        ]);
        listStepsModel.addAll([
          StepModel(),
          StepModel(),
        ]);
      }
    });
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
        ? MyImage(
            url: selectedImagePath!,
            onClose: () => setState(() {
              selectedImagePath = null;
            }),
            onEdit: () => pickerImage((path) => setState(() {
                  selectedImagePath = path;
                  if (!fileSelected.contains('image')) {
                    fileSelected.add('image');
                  }
                })),
          )
        : GestureDetector(
            onTap: () {
              pickerImage((path) => setState(() {
                    selectedImagePath = path;
                    if (!fileSelected.contains('image')) {
                      fileSelected.add('image');
                    }
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
                  text: dishType == 'recipes'
                      ? 'Hãy truyền cảm hứng nấu món này tới mọi người'
                      : 'Chia sẻ mẹo bếp này với mọi người nhé',
                  fontSize: FontSize.z15,
                  fontWeight: FontWeight.w400,
                  color: MyColors.grey['c600']!,
                ),
                imageHasError
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 6),
                            MyText(
                              text: imageErrorText,
                              fontSize: FontSize.z13,
                              lineHeight: 1.38,
                              fontWeight: FontWeight.w600,
                              color: MyColors.support['Error']!['c800']!,
                            ),
                          ],
                        ),
                      )
                    : Container(),
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
            hintText: dishType == 'recipes'
                ? 'Tên món: Món canh bí ngon nhất'
                : 'Tên mẹo: Mẹo làm mềm ức gà',
            fontSize: FontSize.z20,
            hintFontWeight: FontWeight.w600,
            labelFontWeight: FontWeight.w700,
            onChange: (_) => setState(() {
                  labelHasError = false;
                }),
            errorText: labelErrorText,
            hasError: labelHasError,
            controller: _labelController),
        const SizedBox(height: 10),
        MyTextField(
            obscureText: false,
            multipleLine: true,
            errorText: descriptionErrorText,
            hasError: descriptionHasError,
            onChange: (_) => setState(() {
                  descriptionHasError = false;
                }),
            hintText: dishType == 'recipes'
                ? 'Hãy chia sẻ với mọi người về món này của bạn nhé. Ai hay điều gì đã truyền cảm hứng cho bạn nấu nó? Tại sao nó đặc biệt? Bạn thích thưởng thức nó theo cách nào?'
                : 'Hãy chia sẻ với mọi người về mẹo này của bạn nhé. Bạn đã phát hiện nó như thế nào? Tại sao nó đặc biệt?',
            fontSize: FontSize.z17,
            controller: _descriptionController),
        const SizedBox(height: 10),
        dishType == 'recipes'
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                    Expanded(
                      flex: 2,
                      child: MyText(
                        text: 'Khẩu phần',
                        fontSize: FontSize.z17,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey['c600']!,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: MyTextField(
                        obscureText: false,
                        errorText: rangeOfPeopleErrorText,
                        hasError: rangeOfPeopleHasError,
                        controller: _rangeOfPeopleController,
                        onChange: (_) => setState(() {
                          rangeOfPeopleHasError = false;
                        }),
                        hintText: '2 người',
                        fontSize: FontSize.z17,
                      ),
                    )
                  ])
            : Container(),
        dishType == 'recipes'
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                    Expanded(
                      flex: 2,
                      child: MyText(
                        text: 'Thời gian nấu',
                        fontSize: FontSize.z17,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey['c600']!,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: MyTextField(
                        obscureText: false,
                        hasError: cookingTimeHasError,
                        hintText: '1 tiếng 30 phút',
                        errorText: cookingTimeErrorText,
                        onChange: (_) => setState(() {
                          cookingTimeHasError = false;
                        }),
                        fontSize: FontSize.z17,
                        controller: _cookingTimeController,
                      ),
                    )
                  ])
            : Container()
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
          ingredientHasError
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 6),
                          MyText(
                            text: ingredientErrorText,
                            fontSize: FontSize.z13,
                            lineHeight: 1.38,
                            fontWeight: FontWeight.w600,
                            color: MyColors.support['Error']!['c800']!,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(),
          GestureDetector(
            onTap: () {
              setState(() {
                ingredientsList.add(Ingredient());
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
          icon: Icon(Icons.delete, color: MyColors.grey['c700']!),
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
              text: ingredientsList[index].quantity == null
                  ? null
                  : ingredientsList[index].unit == null
                      ? '${ingredientsList[index].quantity}'
                      : '${ingredientsList[index].quantity} ${ingredientsList[index].unit}'),
          onChange: (value) {
            var input = FunctionCore().parseInput(value);
            ingredientsList[index].quantity =
                input['quantity'] != null ? (input['quantity']) : 0;
            ingredientsList[index].unit = input['unit'];
          },
        ),
        Expanded(
            child: Autocomplete<Category>(
                displayStringForOption: (option) => option.label!,
                fieldViewBuilder:
                    (context, controller, focusNode, onEditingComplete) {
                  if (type == 'edit') {
                    controller.text = dish!.ingredients![index].label ?? '';
                  }
                  final text = allCategories
                      .firstWhere(
                          (element) =>
                              element.value == ingredientsList[index].value,
                          orElse: () => Category())
                      .label;
                  if (text != null) {
                    controller.text = text;
                  }
                  return TextField(
                      minLines: 1,
                      maxLines: 10,
                      cursorColor: MyColors.primary['CulturalYellow']!['c700']!,
                      controller: controller,
                      focusNode: focusNode,
                      onEditingComplete: onEditingComplete,
                      onChanged: (value) {
                        ingredientsList[index].label = controller.text;
                        ingredientsList[index].value =
                            FunctionCore.convertToSlug(controller.text);
                        setState(() {
                          ingredientHasError = false;
                        });
                      },
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
                                  itemCount: options.length + 1,
                                  itemBuilder: (context, i) {
                                    if (i < options.length) {
                                      final option = options.elementAt(i);
                                      return GestureDetector(
                                        onTap: () {
                                          onSelected(option);
                                          ingredientsList[index].value =
                                              option.value;
                                          ingredientsList[index].label =
                                              option.label;
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
                                    } else {
                                      return GestureDetector(
                                        onTap: () {},
                                        child: const ListTile(
                                          title: Text('Thêm mới'),
                                          leading: Icon(Icons.add),
                                        ),
                                      );
                                    }
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
          stepHasError
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 6),
                          MyText(
                            text: stepErrorText,
                            fontSize: FontSize.z13,
                            lineHeight: 1.38,
                            fontWeight: FontWeight.w600,
                            color: MyColors.support['Error']!['c800']!,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(),
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
    TextEditingController controller = TextEditingController(
      text: listStepsModel[index].description,
    );
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
                  controller: controller,
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
                              stepHasError = false;
                              listStepsModel[index].image = imagePath;
                              if (!fileSelected
                                  .contains('step_no${index + 1}')) {
                                fileSelected.add('step_no_${index + 1}');
                              }
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
                    : MyImage(
                        url: listStepsModel[index].image!,
                        onClose: () =>
                            setState(() => listStepsModel[index].image = null),
                        borderRadius: BorderRadius.circular(5),
                        onEdit: () => pickerImage((imagePath) {
                          setState(() {
                            listStepsModel[index].image = imagePath;
                            if (!fileSelected.contains('step_no${index + 1}')) {
                              fileSelected.add('step_no_${index + 1}');
                            }
                          });
                        }),
                      )
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

  void onAddDish() {
    List<Ingredient> ingredients = [];
    List<StepModel> steps = [];
    for (var i = 0; i < listStepsModel.length; i++) {
      if (listStepsModel[i].image != null ||
          listStepsModel[i].description != null) {
        listStepsModel[i].no = i + 1;
        steps.add(listStepsModel[i]);
      }
    }
    for (var i = 0; i < ingredientsList.length; i++) {
      if (ingredientsList[i].unit != null ||
          ingredientsList[i].quantity != null &&
              ingredientsList[i].label != null) {
        ingredients.add(ingredientsList[i]);
      }
    }
    if (selectedImagePath == null) {
      setState(() {
        imageHasError = true;
      });
    } else {
      setState(() {
        imageHasError = false;
      });
    }
    if (_labelController.text.isEmpty) {
      setState(() {
        labelHasError = true;
      });
    } else {
      setState(() {
        labelHasError = false;
      });
    }
    if (_descriptionController.text.isEmpty) {
      setState(() {
        descriptionHasError = true;
      });
    } else {
      setState(() {
        descriptionHasError = false;
      });
    }
    if (_rangeOfPeopleController.text.isEmpty) {
      setState(() {
        rangeOfPeopleHasError = true;
      });
    } else {
      setState(() {
        rangeOfPeopleHasError = false;
      });
    }
    if (_cookingTimeController.text.isEmpty) {
      setState(() {
        cookingTimeHasError = true;
      });
    } else {
      setState(() {
        cookingTimeHasError = false;
      });
    }
    if (steps.isEmpty) {
      setState(() {
        stepHasError = true;
      });
    } else {
      setState(() {
        stepHasError = false;
      });
    }
    if (ingredients.isEmpty) {
      setState(() {
        ingredientHasError = true;
      });
    } else {
      setState(() {
        ingredientHasError = false;
      });
    }

    bool hasError = dishType == 'recipes'
        ? labelHasError ||
            descriptionHasError ||
            rangeOfPeopleHasError ||
            cookingTimeHasError ||
            stepHasError ||
            ingredientHasError ||
            imageHasError
        : labelHasError ||
            descriptionHasError ||
            stepHasError ||
            ingredientHasError ||
            imageHasError;

    if (hasError) {
      return;
    } else {
      if (type == 'edit') {
        editDish();
      } else {
        addDish();
      }
    }
  }

  void editDish() async {
    List<Ingredient> ingredients = [];
    List<StepModel> steps = [];
    for (var i = 0; i < listStepsModel.length; i++) {
      if (listStepsModel[i].image != null ||
          listStepsModel[i].description != null) {
        listStepsModel[i].no = i + 1;
        steps.add(listStepsModel[i]);
      }
    }
    for (var i = 0; i < ingredientsList.length; i++) {
      if (ingredientsList[i].unit != null ||
          ingredientsList[i].quantity != null &&
              ingredientsList[i].label != null) {
        ingredients.add(ingredientsList[i]);
      }
    }
    final user = Provider.of<UserProvider>(context, listen: false).user!;
    final Dish dishModel = Dish(
      id: dish!.id!,
      label: _labelController.text,
      description: _descriptionController.text,
      image: selectedImagePath,
      rangeOfPeople: _rangeOfPeopleController.text,
      steps: steps,
      owner: user,
      ingredients: ingredients,
      cookingTime: _cookingTimeController.text,
      type: dishType,
      status: 'PENDING',
    );
    final response = await DishService.updateDish(dishModel, fileSelected);
    if (response) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const HomeScreen(
                    tabIndex: 1,
                  )),
          ModalRoute.withName('/community'));
      showDialog(
          context: context,
          builder: (context) => const MyAlert(
                alertType: AlertType.success,
                title: 'Thành công',
                description:
                    'Sửa món ăn thành công! Hãy chia sẽ chúng với bạn bè và người thân nhé.',
              ));
    } else {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return MyNotification(
                notificationType: NotificationType.error,
                title: 'Lỗi',
                btnList: [
                  MyButton(
                    text: 'Thử lại',
                    buttonType: ButtonType.secondary,
                    onPressed: () => Navigator.pop(context),
                  )
                ],
                description: 'Chỉ cho phép định dạng .png, .jpg và .jpeg!');
          });
    }
  }

  void addDish() async {
    List<Ingredient> ingredients = [];
    List<StepModel> steps = [];
    for (var i = 0; i < listStepsModel.length; i++) {
      if (listStepsModel[i].image != null ||
          listStepsModel[i].description != null) {
        listStepsModel[i].no = i + 1;
        steps.add(listStepsModel[i]);
      }
    }
    for (var i = 0; i < ingredientsList.length; i++) {
      if (ingredientsList[i].unit != null ||
          ingredientsList[i].quantity != null &&
              ingredientsList[i].label != null) {
        ingredients.add(ingredientsList[i]);
      }
    }
    final user = Provider.of<UserProvider>(context, listen: false).user!;
    final Dish dish = Dish(
      label: _labelController.text,
      description: _descriptionController.text,
      image: selectedImagePath,
      rangeOfPeople: _rangeOfPeopleController.text,
      steps: steps,
      ingredients: ingredients,
      cookingTime: _cookingTimeController.text,
      owner: user,
      type: dishType,
    );
    final response = await DishService.addDish(dish);
    if (response) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const HomeScreen(
                    tabIndex: 1,
                  )),
          ModalRoute.withName('/community'));
      showDialog(
          context: context,
          builder: (context) => const MyAlert(
                alertType: AlertType.success,
                title: 'Thành công',
                description:
                    'Thêm món ăn thành công! Hãy chia sẽ chúng với bạn bè và người thân nhé.',
              ));
    } else {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return MyNotification(
                notificationType: NotificationType.error,
                title: 'Lỗi',
                btnList: [
                  MyButton(
                    text: 'Thử lại',
                    buttonType: ButtonType.secondary,
                    onPressed: () => Navigator.pop(context),
                  )
                ],
                description: 'Chỉ cho phép định dạng .png, .jpg và .jpeg!');
          });
    }
  }

  void onSaveDish() async {}
}
