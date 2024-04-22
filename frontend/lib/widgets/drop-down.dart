import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/widgets/text.dart';

class MyDropDownButton extends StatefulWidget {
  final List<Item> items;
  final String? selectedValue;
  final Function(String?)? onSelected;
  final Item? otherAction;
  final Function()? onTapOtherAction;
  const MyDropDownButton({
    super.key,
    required this.items,
    this.selectedValue,
    this.onSelected,
    this.otherAction,
    this.onTapOtherAction,
  });

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue ?? widget.items[0].value;
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> listItems = widget.items
        .map((Item item) => DropdownMenuItem<String>(
              value: item.value,
              child: Text(
                item.label,
                style: TextStyle(
                  fontSize: FontSize.z12,
                  fontWeight: FontWeight.w500,
                  color: MyColors.grey['c900'],
                ),
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
              ),
            ))
        .toList();

    if (widget.otherAction != null) {
      listItems.add(DropdownMenuItem<String>(
        value: widget.otherAction!.value,
        child: Text(
          widget.otherAction!.label,
          style: TextStyle(
            fontSize: FontSize.z12,
            fontWeight: FontWeight.w500,
            color: MyColors.grey['c900'],
          ),
          textAlign: TextAlign.end,
          overflow: TextOverflow.ellipsis,
        ),
      ));
    }
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          children: [
            Expanded(
              child: MyText(
                  text: widget.items
                      .firstWhere((item) => item.value == selectedValue!,
                          orElse: () => Item(label: 'Chọn', value: 'select'))
                      .label,
                  fontSize: FontSize.z12,
                  fontWeight: FontWeight.w500,
                  color: MyColors.grey['c900']!),
            ),
          ],
        ),
        items: [
          ...listItems,
        ],
        value: widget.selectedValue,
        onChanged: (String? value) {
          if (widget.otherAction != null &&
              value == widget.otherAction!.value) {
            if (widget.onTapOtherAction != null) {
              widget.onTapOtherAction!();
            }
          }
          setState(() {
            selectedValue = value;
            widget.onSelected!(value);
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 25,
          width: 110,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: MyColors.primary['CulturalYellow']!['c100']!,
          ),
          elevation: 2,
        ),
        iconStyleData: IconStyleData(
          icon: const Icon(
            Icons.arrow_drop_down,
            size: 16,
          ),
          iconSize: 14,
          iconEnabledColor: MyColors.grey['c900']!,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: MyColors.primary['CulturalYellow']!['c100']!,
          ),
          offset: const Offset(0, -5),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
