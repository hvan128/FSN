import 'package:flutter/material.dart';
import 'package:frontend/theme/color.dart';

class MySwitch extends StatefulWidget {
  final bool value;
  final void Function(bool)? onChange;

  const MySwitch({
    super.key,
    this.value = false,
    this.onChange,
  });

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Switch(
          value: widget.value,
          activeColor: MyColors.white['c900'],
          inactiveThumbColor: MyColors.white['c900'],
          inactiveTrackColor: MyColors.primary['CulturalYellow']!['c200'],
          activeTrackColor: MyColors.primary['CulturalYellow']!['c700'],
          onChanged: (value) {
            if (widget.onChange != null) {
              widget.onChange!(value);
            }
          },
        ),
      ],
    );
  }
}
