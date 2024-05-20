import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/models/community/dish.dart';
import 'package:frontend/models/user/user.dart';
import 'package:frontend/navigation/router/community.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/utils/functions_core.dart';
import 'package:frontend/widgets/text.dart';

class SearchFoodCard extends StatefulWidget {
  final Dish dish;
  final String? keyword;
  const SearchFoodCard({super.key, required this.dish, this.keyword});

  @override
  State<SearchFoodCard> createState() => _SearchFoodCardState();
}

class _SearchFoodCardState extends State<SearchFoodCard> {
  UserModel? owner;
  @override
  void initState() {
    super.initState();
    owner = widget.dish.owner;
  }

  bool shouldBoldLabel(String label, String keyword) {
    List<String> keywords = keyword.trim().split(' ');
    return keywords
        .any((keyword) => label.toLowerCase().contains(keyword.toLowerCase()));
  }

  @override
  Widget build(BuildContext context) {
    List<String> listIngredients = [];
    for (var element in widget.dish.ingredients!) {
      if (element.label != null) {
        listIngredients.add(element.label!);
      }
    }
    final Image noImage = Image.asset(
      "assets/icons/i16/image-default.png",
      width: 30,
      height: 30,
    );
    final Image image = (owner?.imageUrl != null)
        ? Image.network(
            owner!.imageUrl!,
            width: 30,
            height: 30,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) =>
                (loadingProgress == null)
                    ? child
                    : const CircularProgressIndicator(),
            errorBuilder: (context, error, stackTrace) => noImage,
          )
        : noImage;
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
                  Text(
                    widget.dish.label!,
                    style: TextStyle(
                      fontSize: FontSize.z17,
                      letterSpacing: 0.01,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Urbanist',
                      color: MyColors.grey['c900']!,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                  listIngredients.isEmpty
                      ? Container()
                      : const SizedBox(
                          height: 5,
                        ),
                  RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    text: TextSpan(children: [
                      ...listIngredients
                          .map((e) => TextSpan(
                              text: e == listIngredients.last ? e : '$e, ',
                              style: TextStyle(
                                fontSize: FontSize.z15,
                                fontWeight: shouldBoldLabel(e, widget.keyword!)
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: MyColors.grey['c700']!,
                              )))
                          .toList(),
                    ]),
                  ),
                  listIngredients.isEmpty
                      ? Container()
                      : const SizedBox(height: 10),
                  Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: image,
                    ),
                    const SizedBox(width: 5),
                    widget.dish.owner == null
                        ? Container()
                        : MyText(
                            text: widget.dish.owner!.username!,
                            fontSize: FontSize.z12,
                            fontWeight: FontWeight.w400,
                            color: MyColors.grey['c700']!,
                          )
                  ]),
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
