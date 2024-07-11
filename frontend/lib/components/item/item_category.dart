import 'package:flutter/material.dart';
import 'package:frontend/components/modals/modal_filter.dart';
import 'package:frontend/models/category/category.dart';
import 'package:frontend/navigation/router/my_fridge.dart';
import 'package:frontend/services/category/category_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';

class CategoryItem extends StatefulWidget {
  final Category category;
  final bool? isSelected;
  final ViewType? viewType;

  const CategoryItem(
      {super.key,
      required this.category,
      this.isSelected = true,
      this.viewType = ViewType.grid});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  Category? category = Category();
  @override
  void initState() {
    super.initState();
    category = widget.category;
  }

  @override
  Widget build(BuildContext context) {
    final duration = category!.expiryDate!.difference(DateTime.now()).inDays;
    final icon = category!.icon ?? 'assets/icons/i16/image-default.png';
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColors.primary['CulturalYellow']!['c50']!,
              border: Border.all(color: MyColors.grey['c100']!),
            ),
            child: widget.viewType == ViewType.grid
                ? Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: MyColors.white['c900']!,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          padding: const EdgeInsets.only(
                              top: 17, bottom: 8, left: 15, right: 15),
                          child: Stack(
                            children: [
                              Image.asset(icon, width: 40, height: 40),
                              category!.quantity == 0
                                  ? Positioned.fill(
                                      child: Container(
                                          decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: MyColors.white['c900']!
                                            .withOpacity(0.8),
                                      )),
                                    )
                                  : const SizedBox(),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: SizedBox(
                          width: 70,
                          child: MyText(
                            text: category!.label ?? '',
                            fontSize: FontSize.z12,
                            fontWeight: FontWeight.w600,
                            color: category!.quantity == 0
                                ? MyColors.grey['c700']!.withOpacity(0.5)
                                : MyColors.grey['c700']!,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  )
                : Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: MyColors.white['c900']!,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 17, left: 15, right: 15),
                          child: Stack(
                            children: [
                              Image.asset(icon, width: 40, height: 40),
                              category!.quantity == 0
                                  ? Positioned.fill(
                                      child: Container(
                                          decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: MyColors.white['c900']!
                                            .withOpacity(0.8),
                                      )),
                                    )
                                  : const SizedBox(),
                            ],
                          )),
                      const SizedBox(width: 15),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                              text: category!.label ?? '',
                              fontSize: FontSize.z14,
                              fontWeight: FontWeight.w600,
                              color: category!.quantity == 0
                                  ? MyColors.grey['c700']!.withOpacity(0.5)
                                  : MyColors.grey['c700']!),
                          const SizedBox(height: 5),
                          category?.quantity == 0
                              ? const SizedBox()
                              : Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                      color: getDurationColor(duration),
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color: MyColors.grey['c300']!,
                                      )),
                                  child: MyText(
                                      text: 'D - $duration',
                                      fontSize: FontSize.z10,
                                      fontWeight: FontWeight.w600,
                                      color: getDurationTextColor(duration)),
                                ),
                        ],
                      )),
                      Container(
                        width: 100,
                        // decoration: BoxDecoration(
                        //     color: MyColors.primary['CulturalYellow']!['c50']!,
                        //     borderRadius: BorderRadius.circular(20),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: MyColors.grey['c300']!,
                        //         blurRadius: 4,
                        //         offset: const Offset(1, 2),
                        //       )
                        //     ]),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: category?.quantity == 0
                                        ? MyColors
                                            .primary['CulturalYellow']!['c100']!
                                        : MyColors.primary['CulturalYellow']![
                                            'c700']!,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        category!.quantity == 0
                                            ? null
                                            : onMinusQuantity();
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: category!.quantity == 0
                                            ? MyColors.grey['c900']!
                                                .withOpacity(0.5)
                                            : MyColors.grey['c900']!,
                                      ))),
                              MyText(
                                  text: category!.quantity.toString(),
                                  fontSize: FontSize.z15,
                                  fontWeight: FontWeight.w700,
                                  color: MyColors.grey['c900']!),
                              Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: MyColors
                                        .primary['CulturalYellow']!['c700']!,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        onAddQuantity();
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        size: 15,
                                        color: MyColors.grey['c900']!,
                                      ))),
                            ]),
                      ),
                      const SizedBox(width: 15),
                    ],
                  )),
      ),
      widget.viewType == ViewType.list
          ? const SizedBox()
          : Positioned.fill(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                        color: getDurationColor(duration),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: MyColors.grey['c300']!,
                        )),
                    child: MyText(
                        text: 'D - $duration',
                        fontSize: FontSize.z10,
                        fontWeight: FontWeight.w600,
                        color: getDurationTextColor(duration)),
                  ),
                ),
              ),
            ),
      widget.isSelected != null && widget.isSelected!
          ? Positioned.fill(
              child: Container(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.primary['CulturalYellow']!['c700']!
                    .withOpacity(0.5),
              )),
            )
          : const SizedBox(),
      widget.isSelected != null && widget.isSelected!
          ? Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/icons/i16/check-outline.png',
                    width: 20,
                    height: 20,
                    color: MyColors.white['c900'],
                  )))
          : const SizedBox(),
    ]);
  }

  getDurationColor(int duration) {
    if (duration < 0) {
      return MyColors.support['Error']!['c800']!;
    } else if (duration == 0) {
      return MyColors.secondary['DawnOrange']!['c800']!;
    } else {
      return MyColors.grey['c100']!;
    }
  }

  getDurationTextColor(int duration) {
    if (duration > 0) {
      return MyColors.grey['c800']!;
    } else {
      return MyColors.white['c900']!;
    }
  }

  void onMinusQuantity() async {
    if (category!.quantity != null) {
      if (category!.quantity! > 0) {
        setState(() {
          category!.quantity = category!.quantity! - 1;
        });
        await CategoryService()
            .changeQuantity(category!, category!.quantity!)
            .then((value) => CategoryService().deleteCache());
      } else {}
    }
  }

  void onAddQuantity() {
    if (category!.quantity != null) {
      if (category!.quantity! == 0) {
        showDialog(context: context, builder: changeDataDialog);
      }
      setState(() {
        category!.quantity = category!.quantity! + 1;
      });
      CategoryService()
          .changeQuantity(category!, category!.quantity!)
          .then((value) => CategoryService().deleteCache());
    }
  }

  Widget changeDataDialog(BuildContext context) {
    return AlertDialog(
        title: MyText(
          text: 'Bạn có muốn thay đổi ngày nhập và ngày hết hạn?',
          fontSize: FontSize.z14,
          fontWeight: FontWeight.w600,
          color: MyColors.grey['c900']!,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RouterMyFridge.editCategoryDetail,
                    arguments: {'category': category});
              },
              child: MyText(
                text: 'Ok',
                fontSize: FontSize.z14,
                fontWeight: FontWeight.w600,
                color: MyColors.grey['c900']!,
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: MyText(
                text: 'Hủy',
                fontSize: FontSize.z14,
                fontWeight: FontWeight.w600,
                color: MyColors.grey['c900']!,
              )),
        ]);
  }
}
