import 'package:flutter/material.dart';

import 'base_validator.dart';

class LengthValidator extends BaseValidator {
  final int length;

  LengthValidator({required this.length});

  @override
  String getMessage(BuildContext context) {
    return ' ${('Max length is')} $length ${('characters')}';
  }

  @override
  bool validate(String value) {
    // include length value ex if length is 20 then 20 is accepted as string length
    return value.length == length || value.length < length;
  }
}
