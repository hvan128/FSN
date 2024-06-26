import 'dart:async';

import 'package:flutter/material.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:frontend/components/modals/notification_modal.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/divider.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/text.dart';

class DraggableList {
  final String header;
  final List<DraggableListItem> items;

  const DraggableList({
    required this.header,
    required this.items,
  });
}

class DraggableListItem {
  final Category category;
  bool isDeleted;
  bool isSelected;

  DraggableListItem({
    required this.category,
    this.isDeleted = false,
    this.isSelected = false,
  });
}

class DragNDropList extends StatefulWidget {
  final List<ItemFood> listFoods;
  final Function(bool)? showBottomBar;
  final Function(int)? navigateBottomBar;

  const DragNDropList(
      {super.key,
      required this.listFoods,
      this.showBottomBar,
      this.navigateBottomBar});

  @override
  // ignore: library_private_types_in_public_api
  _DragNDropList createState() => _DragNDropList();
}

class _DragNDropList extends State<DragNDropList> {
  late List<DragAndDropList> lists;
  List<DraggableList>? allLists;
  List<DraggableListItem>? allItems;
  List<DraggableListItem> selectedListItems = [];
  List<DraggableListItem> deletedListItems = [];
  bool isSelecting = false;
  bool isSelectedAll = false;
  bool classify = false;

  @override
  void initState() {
    super.initState();
    allLists = widget.listFoods.map((food) {
      return DraggableList(
        header: food.label,
        items: food.categories.map((category) {
          return DraggableListItem(
            category: category,
          );
        }).toList(),
      );
    }).toList();
    lists = allLists!.map(buildList).toList();
    List<Category> allCategories =
        widget.listFoods.expand((food) => food.categories).toSet().toList();
    allItems = allCategories.isNotEmpty
        ? allCategories.map((e) {
            return DraggableListItem(category: e);
          }).toList()
        : [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //!Header
      MyHeader(
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
                if (classify) {
                  classify = false;
                }
              });
              widget.showBottomBar?.call(false);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: MyColors.primary['CulturalYellow']!['c600']!
                    .withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: MyText(
                  text: 'Chọn',
                  fontSize: FontSize.z15,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c900']!),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Image.asset(
            'assets/icons/i16/dots-vertical.png',
            width: 24,
            height: 24,
            color: MyColors.grey['c900'],
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
                  });
                  for (var element in allItems!) {
                    element.isSelected = false;
                    selectedListItems.remove(element);
                    isSelectedAll = false;
                  }
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
      ),
      //! List food
      Expanded(
          child: Stack(children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isSelecting
                        ? Row(
                            children: [
                              Checkbox(
                                activeColor: MyColors
                                    .primary['CulturalYellow']!['c600']!,
                                value: isSelectedAll,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isSelectedAll = value!;
                                    if (isSelectedAll) {
                                      for (var item in allItems!) {
                                        item.isSelected = true;
                                        if (!selectedListItems.contains(item)) {
                                          selectedListItems.add(item);
                                        }
                                      }
                                    } else {
                                      for (var item in allItems!) {
                                        item.isSelected = false;
                                        if (selectedListItems.contains(item)) {
                                          selectedListItems.remove(item);
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
                    // isSelecting
                    //     ? const SizedBox()
                    //     : Row(
                    //         children: [
                    //           MyText(
                    //               text: 'Phân loại',
                    //               fontWeight: FontWeight.w500,
                    //               color: MyColors.grey['c700']!,
                    //               fontSize: FontSize.z16),
                    //           const SizedBox(
                    //             width: 5,
                    //           ),
                    //           MySwitch(
                    //               value: classify,
                    //               onChange: (value) {
                    //                 setState(() {
                    //                   classify = value;
                    //                 });
                    //               }),
                    //           const SizedBox(
                    //             width: 5,
                    //           )
                    //         ],
                    //       )
                  ],
                ),
                Expanded(child: _buildList()),
              ],
            )),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 100),
          bottom: isSelecting ? 0 : -70,
          child: _buildOptions(),
        ),
      ])),
    ]);
  }

  Widget _buildList() {
    return classify
        ? DragAndDropLists(
            // lastItemTargetHeight: 50,
            // addLastItemTargetHeightToTop: true,
            // lastListTargetSize: 30,
            listPadding: const EdgeInsets.symmetric(horizontal: 10),
            listInnerDecoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(10),
            ),
            children: lists,
            itemDivider: const MyDivider(
              type: Type.solid,
            ),
            itemDecorationWhileDragging: BoxDecoration(
              color: MyColors.grey['c100']!,
              boxShadow: [
                BoxShadow(color: MyColors.grey['c300']!, blurRadius: 4)
              ],
            ),
            listDragHandle: buildDragHandle(isList: true),
            itemDragHandle: buildDragHandle(),
            onItemReorder: onReorderListItem,
            onListReorder: onReorderList,
          )
        : ReorderableListView(
            children: allItems != null
                ? allItems!
                    .map((item) => Dismissible(
                          key: ValueKey(item.category.value),
                          confirmDismiss: (direction) async {
                            if (direction == DismissDirection.endToStart) {
                              return await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return MyNotification(
                                      title: 'Xóa',
                                      description:
                                          'Xóa ${item.category.label} ?',
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
                              return await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return MyNotification(
                                      title: 'Xóa',
                                      description:
                                          'Xóa ${item.category.label} ?',
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
                            }
                          },
                          onDismissed: (direction) =>
                              onDismissedItem(direction, item),
                          secondaryBackground: Container(
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
                                  ))),
                          background: Container(
                              height: 40,
                              color:
                                  MyColors.primary['CulturalYellow']!['c600']!,
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
                              )),
                          child: Column(
                            children: [
                              Container(
                                color:
                                    MyColors.primary['CulturalYellow']!['c50']!,
                                child: Row(
                                  children: [
                                    isSelecting
                                        ? Checkbox(
                                            activeColor: MyColors.primary[
                                                'CulturalYellow']!['c600']!,
                                            value: item.isSelected,
                                            onChanged: (bool? value) {
                                              print(selectedListItems.length);
                                              setState(() {
                                                item.isSelected = value!;
                                                if (item.isSelected) {
                                                  selectedListItems.add(item);
                                                } else {
                                                  selectedListItems
                                                      .remove(item);
                                                }
                                              });
                                            },
                                          )
                                        : Container(),
                                    Expanded(
                                      child: ListTile(
                                        leading: Image.asset(
                                          item.category.icon!,
                                          width: 40,
                                          height: 40,
                                          color: item.isDeleted
                                              ? MyColors.grey['c700']!
                                                  .withOpacity(0.4)
                                              : null,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(
                                          item.category.label!,
                                          style: item.isDeleted
                                              ? const TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
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
                                            if (classify) {
                                              classify = false;
                                            }
                                            item.isSelected = !item.isSelected;
                                            if (item.isSelected) {
                                              selectedListItems.add(item);
                                            } else {
                                              selectedListItems.remove(item);
                                            }
                                          });
                                          widget.showBottomBar?.call(false);
                                        },
                                      ),
                                    ),
                                    !isSelecting && !item.isDeleted
                                        ? Container(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Icon(Icons.menu,
                                                color: MyColors.primary[
                                                        'CulturalYellow']![
                                                    'c600']!),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                              const MyDivider(type: Type.solid),
                            ],
                          ),
                        ))
                    .toList()
                : [
                    Center(
                        child: MyText(
                            text: 'Chưa có đò ăn nào được thêm vào danh sách',
                            fontSize: FontSize.z14,
                            fontWeight: FontWeight.bold,
                            color: MyColors.grey['c300']!.withOpacity(0.5))),
                  ],
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  if (allItems![newIndex - 1].isDeleted) {
                    newIndex = allItems!.indexOf(
                          allItems!.firstWhere((element) => element.isDeleted),
                        ) -
                        1;
                  } else {
                    newIndex -= 1;
                  }
                }
                final DraggableListItem item = allItems!.removeAt(oldIndex);
                allItems!.insert(newIndex, item);
              });
            },
          );
  }

  DragHandle buildDragHandle({bool isList = false}) {
    final verticalAlignment = isList
        ? DragHandleVerticalAlignment.top
        : DragHandleVerticalAlignment.center;
    final color = isList
        ? MyColors.primary['CulturalYellow']!['c600']
        : MyColors.primary['CulturalYellow']!['c900']!;

    return DragHandle(
      verticalAlignment: verticalAlignment,
      child: Container(
        padding: const EdgeInsets.only(right: 10),
        child: Icon(Icons.menu, color: color),
      ),
    );
  }

  DragAndDropList buildList(DraggableList list) => DragAndDropList(
        header: Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            list.header,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        children: list.items
            .map((item) => DragAndDropItem(
                  child: ListTile(
                    leading: Image.asset(
                      item.category.icon!,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item.category.label!,
                        style: TextStyle(
                            fontSize: 14,
                            decoration: item.isDeleted
                                ? TextDecoration.lineThrough
                                : null)),
                  ),
                ))
            .toList(),
      );

  void onReorderListItem(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    setState(() {
      final oldListItems = lists[oldListIndex].children;
      final newListItems = lists[newListIndex].children;

      final movedItem = oldListItems.removeAt(oldItemIndex);
      newListItems.insert(newItemIndex, movedItem);
    });
  }

  void onReorderList(
    int oldListIndex,
    int newListIndex,
  ) {
    setState(() {
      final movedList = lists.removeAt(oldListIndex);
      lists.insert(newListIndex, movedList);
    });
  }

  void handleDeleteCategory() {
    setState(() {});
  }

  Widget _buildOptions() {
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
            _option('assets/icons/i16/save.png', 'Bảo quản'),
            _option('assets/icons/i16/delete.png', 'Xóa'),
            GestureDetector(
                onTap: () {
                  setState(() {
                    selectedListItems.clear();
                  });
                },
                child:
                    _option('assets/icons/i16/un-check.png', 'Bỏ chọn tất cả')),
          ]),
    );
  }

  Widget _option(String icon, String label) {
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

  void handleTapItem(DraggableListItem item) {
    if (isSelecting) {
      setState(() {
        item.isSelected = !item.isSelected;
      });
      if (item.isSelected) {
        selectedListItems.add(item);
      } else {
        selectedListItems.remove(item);
      }
    } else {
      setState(() {
        item.isDeleted = !item.isDeleted;
        if (item.isDeleted) {
          deletedListItems.add(item);
        } else {
          deletedListItems.remove(item);
        }
      });
      final DraggableListItem newItem =
          allItems!.removeAt(allItems!.indexOf(item));
      allItems!.add(newItem);
    }
  }

  FutureOr<bool> onConfirmDismiss(
      DismissDirection direction, DraggableListItem item) async {
    if (direction == DismissDirection.endToStart) {
      return await showDialog(
          context: context,
          builder: (context) {
            return MyNotification(
              title: 'Xóa',
              description: 'Xóa ${item.category.label} ?',
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
      return await showDialog(
          context: context,
          builder: (context) {
            return MyNotification(
              title: 'Xóa',
              description: 'Xóa ${item.category.label} ?',
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
    }
  }

  onDismissedItem(DismissDirection direction, DraggableListItem item) {
    if (direction == DismissDirection.endToStart) {
      
    }
  }
  void onDelete() {
    //   ApiService.delete('${Config.CATEGORIES_API}/$element').then((value) {
    //     showDialog(
    //         context: context,
    //         builder: (context) {
    //           return MyAlert(
    //             alertType: AlertType.success,
    //             position: AlertPosition.topCenter,
    //             title: 'Thành công',
    //             description: 'Xóa ${isSelected.length} đồ ăn khỏi tủ lạnh!',
    //           );
    //         });
    //   });
    
    // setState(() {
    //   isSelecting = false;
    // });
    // widget.showBottomBar!(true);
    // clearCache();
  }
}
