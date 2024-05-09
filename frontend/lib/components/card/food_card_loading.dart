import 'package:flutter/material.dart';
import 'package:frontend/components/card/food_card.dart';
import 'package:frontend/widgets/skeleton.dart';

class FoodCardLoading extends StatefulWidget {
  final CardType? type;

  const FoodCardLoading({super.key, this.type = CardType.normal});

  @override
  State<FoodCardLoading> createState() => _FoodCardLoadingState();
}

class _FoodCardLoadingState extends State<FoodCardLoading> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.type == CardType.small
          ? MediaQuery.of(context).size.width * 0.5 - 22
          : 300,
      height: widget.type == CardType.small
          ? MediaQuery.of(context).size.width * 0.4
          : 238,
      child: const Skeleton(),
    );
  }
}
