import 'package:flutter/material.dart';

import 'conversion_drop_down_buttons.dart';
import 'conversion_form_widget.dart';
import 'header_conversion_screen.dart';
import 'text_conversion_question.dart';

class BodyConversionScreen extends StatelessWidget {
  const BodyConversionScreen({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        HeaderConversionScreen(),
        TextConversionQuestion(),
        ConversionDropDownButtons(),
        ConversionFormWidget(),
      ],
    );
  }
}
