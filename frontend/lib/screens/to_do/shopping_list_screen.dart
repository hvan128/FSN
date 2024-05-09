import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/components/modals/alert_modal.dart';
import 'package:frontend/components/modals/notification_modal.dart';
import 'package:frontend/components/to_do/card_add_categories.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/navigation/navigation.dart';
import 'package:frontend/provider/user.dart';
import 'package:frontend/screens/search/search_screen.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/category/category_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/text.dart';
import 'package:provider/provider.dart';

class ShoppingListScreen extends StatefulWidget {
  final Function(bool)? showBottomBar;
  final Function(int)? navigateBottomBar;
  const ShoppingListScreen(
      {super.key, this.showBottomBar, this.navigateBottomBar});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  bool isSelecting = false;
  bool isSelectedAll = false;
  List<Category> allCategories = [];
  List<int> selectedListItems = [];
  List<int> completedListItems = [];

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  bool checkCategoryIsExist(Category category) {
    bool isExist = false;
    for (var item in allCategories) {
      if (item.value == category.value) {
        isExist = true;
        break;
      }
    }
    return isExist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isSelecting
          ? null
          : FloatingActionButton(
              onPressed: () => addCategory(context),
              backgroundColor: MyColors.primary['CulturalYellow']!['c500']!,
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
            ),
      body: SafeArea(
        child: Column(children: [
          header(),
          Expanded(
            child: Stack(children: [
              body(),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                bottom: isSelecting ? 0 : -70,
                child: buildOptions(),
              ),
            ]),
          ),
        ]),
      ),
    );
  }

  void addCategory(BuildContext context) async {
    Loading.showLoading();
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const SearchScreen(type: SearchType.shoppingList);
    }));
    if (result == null) {
      Loading.hideLoading();
    } else {
      if (checkCategoryIsExist(result)) {
        Loading.hideLoading();
        showDialog(
            context: context,
            builder: (context) => MyAlert(
                  alertType: AlertType.error,
                  description:
                      '${result.label} đã tồn tại trong danh sách',
                  title: 'Vui lòng chọn danh mục khác',
                ));
        return;
      } else {
        allCategories.add(result);
        final fridgeId =
            Provider.of<UserProvider>(context, listen: false).user!.fridgeId!;
        await ApiService.post(Config.CATEGORIES_API, {
          'label': result.label,
          'type': result.type,
          'icon': result.icon,
          'value': result.value,
          'fridgeId': fridgeId,
          'positionId': 0,
          'no': allCategories.length + 1
        });
        await APICacheManager().deleteCache('categories_0');
        await APICacheManager().deleteCache('categories');
        Loading.hideLoading();
        getAllCategories();
      }
    }
  }

  void getAllCategories() async {
    List<Category> categories =
        await CategoryService().getCategoriesByPosition(positionId: 0);
    setState(() {
      allCategories = categories;
      for (var element in categories) {
        if (element.completed == 1) {
          completedListItems.add(element.id!);
          print(element.id);
        }
      }
    });
  }

  header() {
    return MyHeader(
      bgUnderColor: MyColors.primary['CulturalYellow']!['c50']!,
      title: isSelecting
          ? 'Đã chọn ${selectedListItems.length}'
          : "Danh sách mua sắm",
      bgColor: MyColors.white['c900']!,
      disableRightButton: isSelecting,
      rightIcon: Row(children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSelecting = true;
            });
            widget.showBottomBar?.call(false);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color:
                  MyColors.primary['CulturalYellow']!['c600']!.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: MyText(
                text: 'Chọn',
                fontSize: FontSize.z15,
                fontWeight: FontWeight.w600,
                color: MyColors.grey['c900']!),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return MyNotification(
                    description:
                        'Thêm tất cả các món ăn có số lượng 0 vào danh sách mua sắm. Các món ăn đã có trong danh sách sẽ không được thêm vào.',
                    notificationType: NotificationType.info,
                    title: 'Thêm nhanh',
                    btnList: [
                      MyButton(
                        text: 'Đồng ý',
                        onPressed: () => flashAddToShoppingList(context),
                      ),
                      MyButton(
                          text: 'Quay lại danh sách',
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ],
                  );
                });
          },
          child: Image.asset(
            'assets/icons/i16/flash-auto.png',
            width: 26,
            height: 26,
            color: MyColors.grey['c900'],
          ),
        ),
      ]),
      leftIcon: isSelecting
          ? IconButton(
              icon: Image.asset(
                'assets/icons/i16/close.png',
                width: 24,
                height: 24,
                color: MyColors.grey['c900']!,
              ),
              onPressed: () {
                widget.showBottomBar?.call(true);
                setState(() {
                  isSelecting = !isSelecting;
                  selectedListItems.clear();
                  isSelectedAll = false;
                });
              })
          : null,
      onLeftPressed: () {
        isSelecting
            ? {
                setState(() {
                  isSelecting = !isSelecting;
                }),
              }
            : widget.navigateBottomBar!(0);
      },
    );
  }

  body() {
    Widget background = Container(
        height: 40,
        color: MyColors.primary['CulturalYellow']!['c600']!,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Image.asset(
                'assets/icons/i16/save.png',
                width: 26,
                height: 26,
                color: MyColors.grey['c900'],
              ),
              const SizedBox(
                width: 10,
              ),
              MyText(
                  text: 'Bảo quản',
                  fontSize: FontSize.z14,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c900']!),
            ],
          ),
        ));
    Widget secondaryBackground = Container(
        height: 40,
        color: const Color.fromARGB(255, 200, 72, 63),
        alignment: Alignment.centerRight,
        child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyText(
                    text: 'Xóa',
                    fontSize: FontSize.z14,
                    fontWeight: FontWeight.w600,
                    color: MyColors.white['c900']!),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/icons/i16/delete.png',
                  width: 26,
                  height: 26,
                  color: MyColors.white['c900'],
                ),
              ],
            )));
    final List<Widget> cards = <Widget>[
      for (var item in allCategories)
        Dismissible(
          key: UniqueKey(),
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.endToStart) {
              return await showDialog(
                  context: context,
                  builder: (context) {
                    return MyNotification(
                      title: 'Xóa',
                      description: 'Xóa ${item.label} ?',
                      notificationType: NotificationType.info,
                      btnList: [
                        MyButton(
                            text: 'Xóa',
                            onPressed: () {
                              Navigator.pop(context, true);
                            }),
                        MyButton(
                            text: 'Trở lại danh sách',
                            onPressed: () {
                              Navigator.pop(context, false);
                            })
                      ],
                    );
                  });
            } else {
              return await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return CardAddCategory(category: item);
                  });
            }
          },
          onDismissed: (direction) => onDismissed(direction, item),
          background: background,
          secondaryBackground: secondaryBackground,
          child: Container(
            color: MyColors.primary['CulturalYellow']!['c50']!,
            child: Row(
              children: [
                isSelecting
                    ? Checkbox(
                        activeColor:
                            MyColors.primary['CulturalYellow']!['c600']!,
                        value: selectedListItems.contains(item.id),
                        onChanged: (bool? value) {
                          print(selectedListItems.length);
                          setState(() {
                            if (value == true &&
                                selectedListItems.contains(item.id) == false) {
                              selectedListItems.add(item.id!);
                            } else if (value == false &&
                                selectedListItems.contains(item.id) == true) {
                              selectedListItems.remove(item.id!);
                            } else {
                              selectedListItems.remove(item.id!);
                            }
                          });
                        },
                      )
                    : Container(),
                Expanded(
                  child: ListTile(
                    leading: Image.asset(
                      item.icon != null ? item.icon! : 'assets/icons/i16/image-default.png',
                      width: 40,
                      height: 40,
                      color: item.completed! == 1
                          ? MyColors.grey['c700']!.withOpacity(0.4)
                          : null,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      item.label!,
                      style: item.completed! == 1
                          ? const TextStyle(
                              // color: MyColors.grey['c500']!,
                              decoration: TextDecoration.lineThrough,
                              fontSize: FontSize.z14)
                          : const TextStyle(
                              fontSize: FontSize.z14,
                            ),
                    ),
                    onTap: () {
                      handleTapItem(item);
                    },
                    onLongPress: () {
                      setState(() {
                        isSelecting = true;
                        if (selectedListItems.contains(item.id) == false) {
                          selectedListItems.add(item.id!);
                        } else {
                          selectedListItems.remove(item.id);
                        }
                      });
                      widget.showBottomBar?.call(false);
                    },
                  ),
                ),
                !isSelecting && item.completed! == 0
                    ? Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.menu,
                            color:
                                MyColors.primary['CulturalYellow']!['c600']!),
                      )
                    : Container(),
              ],
            ),
          ),
        )
    ];

    Widget selectAll = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isSelecting
            ? Row(
                children: [
                  Checkbox(
                    activeColor: MyColors.primary['CulturalYellow']!['c600']!,
                    value: isSelectedAll,
                    onChanged: (bool? value) {
                      setState(() {
                        isSelectedAll = value!;
                        if (isSelectedAll) {
                          for (var item in allCategories) {
                            if (!selectedListItems.contains(item.id)) {
                              selectedListItems.add(item.id!);
                            }
                          }
                        } else {
                          for (var item in allCategories) {
                            if (selectedListItems.contains(item.id)) {
                              selectedListItems.remove(item.id);
                            }
                          }
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  MyText(
                      text: 'Chọn tất cả',
                      fontWeight: FontWeight.w600,
                      color: MyColors.grey['c900']!,
                      fontSize: FontSize.z18),
                ],
              )
            : const SizedBox(),
      ],
    );

    if (allCategories.isEmpty) {
      return Container();
    } else {
      return Column(
        children: [
          isSelecting ? selectAll : Container(),
          Expanded(
            child: ReorderableListView(
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    if (allCategories[newIndex - 1].completed! == 1) {
                      newIndex = allCategories.indexOf(
                            allCategories.firstWhere(
                                (element) => element.completed == 1),
                          ) -
                          1;
                    } else {
                      newIndex -= 1;
                    }
                  }
                  final Category item = allCategories.removeAt(oldIndex);
                  allCategories.insert(newIndex, item);
                  ApiService.post(
                      '${Config.CATEGORIES_API}/shoppingList/reorder', {
                    'oldOrder': allCategories.length - oldIndex,
                    'newOrder': allCategories.length - newIndex,
                    'id': item.id,
                    'fridgeId': item.fridgeId,
                  });
                  APICacheManager().deleteCache('categories_0');
                });
              },
              children: cards,
            ),
          ),
        ],
      );
    }
  }

  void handleTapItem(Category item) {
    if (isSelecting) {
      setState(() {
        if (selectedListItems.contains(item.id)) {
          selectedListItems.remove(item.id);
        } else {
          selectedListItems.add(item.id!);
        }
      });
    } else {
      setState(() {
        item.completed = item.completed == 0 ? 1 : 0;
        if (item.completed! == 1) {
          completedListItems.add(item.id!);
          ApiService.post('${Config.CATEGORIES_API}/completed', {
            'id': item.id,
            'fridgeId': item.fridgeId,
            'completed': 1,
            'no': item.no,
            'maxNo': allCategories.length
          });
          APICacheManager().deleteCache('categories_0');
          APICacheManager().deleteCache('categories');
          final Category newItem =
              allCategories.removeAt(allCategories.indexOf(item));
          allCategories.add(newItem);
        } else {
          completedListItems.remove(item.id!);
          ApiService.post('${Config.CATEGORIES_API}/completed', {
            'id': item.id,
            'fridgeId': item.fridgeId,
            'completed': 0,
            'no': item.no,
            'maxNo': allCategories.length
          });
          APICacheManager().deleteCache('categories_0');
          APICacheManager().deleteCache('categories');
          final Category newItem =
              allCategories.removeAt(allCategories.indexOf(item));
          allCategories.insert(0, newItem);
        }
      });
    }
  }

  onDismissed(DismissDirection direction, Category item) {
    if (direction == DismissDirection.endToStart) {
      setState(() {
        allCategories.remove(item);
        CategoryService().deleteCategory(item.id!);
        ApiService.post('${Config.CATEGORIES_API}/shoppingList/reorder', {
          'oldOrder': item.no,
          'id': item.id,
          'fridgeId': item.fridgeId,
        });
        APICacheManager().deleteCache('categories_0');
        getAllCategories();
      });
    } else {
      setState(() {
        allCategories.remove(item);
        CategoryService().deleteCategory(item.id!);
        ApiService.post('${Config.CATEGORIES_API}/shoppingList/reorder', {
          'oldOrder': item.no,
          'id': item.id,
          'fridgeId': item.fridgeId,
        });
        APICacheManager().deleteCache('categories_0');
        getAllCategories();
      });
    }
  }

  Widget buildOptions() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 4),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: MyColors.primary['CulturalYellow']!['c700']!,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            option('assets/icons/i16/save.png', 'Bảo quản'),
            GestureDetector(
                onTap: () async {
                  Loading.showLoading();
                  for (var item in selectedListItems) {
                    final Category category = allCategories.firstWhere(
                      (element) => element.id == item,
                    );
                    allCategories.remove(category);
                    await CategoryService().deleteCategory(item);
                    ApiService.post(
                        '${Config.CATEGORIES_API}/shoppingList/reorder', {
                      'oldOrder': category.no,
                      'id': category.id,
                      'fridgeId': category.fridgeId,
                    });
                  }
                  APICacheManager().deleteCache('categories_0');
                  setState(() {
                    selectedListItems.clear();
                    isSelecting = false;
                    getAllCategories();
                  });
                  widget.showBottomBar!(true);
                  Loading.hideLoading();
                },
                child: option('assets/icons/i16/delete.png', 'Xóa')),
            GestureDetector(
                onTap: () {
                  setState(() {
                    selectedListItems.clear();
                  });
                },
                child:
                    option('assets/icons/i16/un-check.png', 'Bỏ chọn tất cả')),
          ]),
    );
  }

  Widget option(String icon, String label) {
    return Column(
      children: [
        Image.asset(icon, width: 25, height: 25, color: MyColors.grey['c900']!),
        const SizedBox(
          height: 5,
        ),
        MyText(
            text: label,
            fontSize: FontSize.z12,
            fontWeight: FontWeight.w600,
            color: MyColors.grey['c900']!),
      ],
    );
  }

  void flashAddToShoppingList(BuildContext context) async {
    Loading.showLoading();
    final List<Category> categories =
        await CategoryService().getAllCategories();
    final fridgeId =
        Provider.of<UserProvider>(context, listen: false).user!.fridgeId!;
    for (var item in categories) {
      if (item.quantity == 0 && checkCategoryIsExist(item) == false) {
        await ApiService.post(Config.CATEGORIES_API, {
          'label': item.label,
          'type': item.type,
          'icon': item.icon,
          'value': item.value,
          'fridgeId': fridgeId,
          'positionId': 0,
          'no': allCategories.length + 1
        });
      }
    }
    await APICacheManager().deleteCache('categories_0');
    await APICacheManager().deleteCache('categories');
    Loading.hideLoading();
    Navigate.pop();
    getAllCategories();
  }
}
