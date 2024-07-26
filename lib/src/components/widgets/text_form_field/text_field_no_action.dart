import 'package:flutter/material.dart';

class JDisableTextField extends StatelessWidget {
  const JDisableTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: false,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ));
  }
}
