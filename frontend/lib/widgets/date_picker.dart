import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';
import 'package:frontend/theme/font_size.dart';
import 'package:frontend/widgets/text.dart';
import 'package:intl/intl.dart';

class MyDatePicker extends StatefulWidget {
  final ValueChanged<DateTime> onDateSelected;
  final String? label;
  final DateTime? defaultValue; // Add defaultValue prop

  const MyDatePicker({
    super.key,
    required this.onDateSelected,
    this.label,
    this.defaultValue, // Initialize defaultValue in constructor
  });

  @override
  State<MyDatePicker> createState() =>
      _MyDatePickerState(); // Pass defaultValue to state
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime? selectedDate;
  final inputFormat = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
    selectedDate = widget.defaultValue ?? DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: MyColors.primary['CulturalYellow']![
                  'c300']!, // header background color
              onPrimary: MyColors.grey['c900']!, // header text color
              onSurface: MyColors.grey['c900']!, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: MyColors.grey['c900']!,
                  backgroundColor: MyColors
                      .primary['CulturalYellow']!['c300'] // button text color
                  ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
          height: 25,
          width: 110,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: MyColors.primary['CulturalYellow']!['c100']!,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: MyColors.grey['c300']!,
                  blurRadius: 4,
                  offset: const Offset(1, 2),
                )
              ]),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyText(
                  text: inputFormat.format(selectedDate!),
                  fontSize: FontSize.z12,
                  fontWeight: FontWeight.w500,
                  color: MyColors.grey['c900']!),
              Image.asset(
                "assets/icons/i16/calendar.png",
                width: 15,
                height: 15,
                color: MyColors.grey['c900']!,
              )
            ],
          )),
    );
  }
}
