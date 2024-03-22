import 'package:flutter/material.dart';
import 'package:frontend/components/community/dish_detail.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/types/dish.dart';

class DishDetailScreen extends StatefulWidget {
  final Dish dish;
  const DishDetailScreen({super.key, required this.dish});

  @override
  State<DishDetailScreen> createState() => _DishDetailScreenState();
}

class _DishDetailScreenState extends State<DishDetailScreen> {
  ScrollController scrollController = ScrollController();
  bool? showHeader = false;
  @override
  void initState() {
    super.initState();
    // scrollController.addListener(() {
    //   if (scrollController.offset > MediaQuery.of(context).size.height / 3) {
    //     setState(() {
    //       showHeader = true;
    //     });
    //   } else {
    //     setState(() {
    //       showHeader = false;
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(children: [
          SingleChildScrollView(
              controller: scrollController,
              child: DishDetail(dish: widget.dish)),
          Positioned.fill(
              child: SafeArea(
            child: Align(
                alignment: Alignment.topCenter, child: _buildHeader(context)),
          )),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 50,
                color: showHeader == true
                    ? MyColors.white['c900']
                    : MyColors.transparent,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: showHeader == true
                ? MyColors.white['c900']
                : MyColors.transparent),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Image.asset(
                'assets/icons/i16/back.png',
                color: showHeader == true
                    ? MyColors.grey['c900']!
                    : MyColors.white['c900']!,
                width: 24,
                height: 24,
              ),
            ),
            Row(children: [
              Image.asset(
                'assets/icons/i16/camera.png',
                width: 34,
                height: 34,
                color: showHeader == true
                    ? MyColors.grey['c900']!
                    : MyColors.white['c900']!,
              ),
              const SizedBox(width: 10),
              Image.asset('assets/icons/i16/bookmark-outline.png',
                  color: showHeader == true
                      ? MyColors.grey['c900']!
                      : MyColors.white['c900']!,
                  width: 24,
                  height: 24),
              const SizedBox(width: 10),
              Image.asset('assets/icons/i16/dots-horizontal.png',
                  color: showHeader == true
                      ? MyColors.grey['c900']!
                      : MyColors.white['c900']!,
                  width: 24,
                  height: 24),
            ])
          ]),
        ));
  }
}
