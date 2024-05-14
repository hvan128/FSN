import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/config.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/router/community.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/text.dart';

class MyFoodCard extends StatefulWidget {
  final Dish dish;
  const MyFoodCard({super.key, required this.dish});

  @override
  State<MyFoodCard> createState() => _MyFoodCardState();
}

class _MyFoodCardState extends State<MyFoodCard> {
  UserModel? owner;
  @override
  void initState() {
    super.initState();
    owner = widget.dish.owner;
  }

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouterCommunity.dishDetail,
            arguments: {'dish': widget.dish, 'owner': owner});
      },
      child: Container(
        height: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColors.white['c900']!,
            boxShadow: [
              BoxShadow(
                color: MyColors.grey['c300']!,
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(3, 2),
              )
            ]),
        child: Row(children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: widget.dish.label!,
                    fontSize: FontSize.z17,
                    fontWeight: FontWeight.w800,
                    color: MyColors.grey['c900']!,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Image.asset(
                      'assets/icons/i16/clock.png',
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 5),
                    widget.dish.cookingTime == null
                        ? Container()
                        : MyText(
                            text: widget.dish.cookingTime!,
                            fontSize: FontSize.z15,
                            fontWeight: FontWeight.w400,
                            color: MyColors.grey['c700']!,
                          ),
                    const SizedBox(width: 15),
                    Image.asset(
                      'assets/icons/i16/person.png',
                      width: 17,
                      height: 17,
                      color: MyColors.grey['c700']!,
                    ),
                    const SizedBox(width: 5),
                    widget.dish.rangeOfPeople == null
                        ? Container()
                        : MyText(
                            text: RegExp(r'^[\d-\s]+$')
                                    .hasMatch(widget.dish.rangeOfPeople!)
                                ? '${widget.dish.rangeOfPeople} người'
                                : widget.dish.rangeOfPeople!,
                            fontSize: FontSize.z15,
                            fontWeight: FontWeight.w400,
                            color: MyColors.grey['c700']!,
                          )
                  ]),
                  const SizedBox(height: 10),
                  Text(
                    '${widget.dish.description}',
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 0.01,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Urbanist',
                      color: MyColors.grey['c800']!,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Image.network(
                    FunctionCore.convertImageUrl(widget.dish.image!),
                    height: 170,
                    fit: BoxFit.cover),
              ))
        ]),
      ),
    );
  }
}
