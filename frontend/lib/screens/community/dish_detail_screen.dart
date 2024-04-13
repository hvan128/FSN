import 'package:flutter/material.dart';
import 'package:frontend/components/community/dish_detail.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/types/dish.dart';
import 'package:frontend/widgets/button_icon.dart';

class DishDetailScreen extends StatefulWidget {
  const DishDetailScreen({super.key});

  @override
  State<DishDetailScreen> createState() => _DishDetailScreenState();
}

class _DishDetailScreenState extends State<DishDetailScreen> {
  Dish? dish;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final arguments = ModalRoute.of(context)?.settings.arguments as Map;
      setState(() {
        dish = arguments['dish'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyIconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset('assets/icons/i16/back.png',
                            width: 25,
                            height: 25,
                            color: MyColors.grey['c900']!)),
                    Row(
                      children: [
                        MyIconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/icons/i16/camera.png',
                                width: 25,
                                height: 25,
                                color: MyColors.grey['c900']!)),
                        const SizedBox(width: 20),
                        MyIconButton(
                            onPressed: () {},
                            icon: Image.asset(
                                'assets/icons/i16/bookmark-outline.png',
                                width: 25,
                                height: 25,
                                color: MyColors.grey['c900']!)),
                      ],
                    ),
                  ]),
              automaticallyImplyLeading: false,
              backgroundColor: MyColors.white['c900']!,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  dish!.image,
                  fit: BoxFit.cover,
                ),
              )),
          SliverToBoxAdapter(
            child: DishDetail(dish: dish!),
          )
        ],
      ),
    );
  }
}
