import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/widgets/text.dart';

class ModalSelect extends StatefulWidget {
  final String title;
  final List<Item>? options;
  final Function(Item)? onSelectItem;
  final Item? selectedItem;
  final double? height;

  const ModalSelect(
      {super.key,
      required this.title,
      this.options,
      this.onSelectItem,
      this.height,
      this.selectedItem});

  @override
  State<ModalSelect> createState() => _ModalSelectState();
}

class _ModalSelectState extends State<ModalSelect> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 250,
      decoration: BoxDecoration(
          color: MyColors.white["c900"]!,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(
        children: [
          const DragStick(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                MyText(
                    text: widget.title,
                    fontSize: FontSize.z17,
                    fontWeight: FontWeight.w700,
                    color: MyColors.grey['c800']!,
                    textAlign: TextAlign.left)
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: widget.height != null ? widget.height! - 60 : 191,
              child: widget.options != null
                  ? ListView.builder(
                      itemCount: widget.options!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            widget.onSelectItem?.call(widget.options![index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Option(
                              item: widget.options![index],
                              selectedItem: widget.selectedItem,
                            ),
                          ),
                        );
                      },
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}

class Option extends StatelessWidget {
  final Item? item;
  final Item? selectedItem;

  const Option({super.key, this.item, this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: item != null &&
                selectedItem != null &&
                selectedItem?.value == item!.value
            ? MyColors.grey['c200']!
            : null,
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                item != null && item!.icon != null
                    ? Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: MyColors.grey['c200']!,
                            )),
                        child: CircleAvatar(
                          backgroundImage: item != null && item!.icon != null
                              ? AssetImage(item!.icon!)
                              : null,
                          radius: FontSize.z20,
                        ))
                    : Container(),
                const SizedBox(
                  width: 16,
                ),
                MyText(
                  text: item != null ? item!.label : '',
                  fontSize: FontSize.z16,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey['c700']!,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DragStick extends StatelessWidget {
  const DragStick({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
