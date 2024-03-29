import 'package:flutter/material.dart';
import 'package:frontend/widgets/text_field.dart';

class IngredientTextField extends StatefulWidget {
  final String? hintText; 
  const IngredientTextField({super.key, this.hintText});

  @override
  State<IngredientTextField> createState() => _IngredientTextFieldState();
}

class _IngredientTextFieldState extends State<IngredientTextField> {
  @override
  Widget build(BuildContext context) {
    return MyTextField(
      obscureText: false,
      hasError: false,
      hintText: widget.hintText,
    );
  }
}
