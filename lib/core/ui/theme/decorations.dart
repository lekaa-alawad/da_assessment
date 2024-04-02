import 'package:flutter/material.dart';

import 'app_theme.dart';

final buttonDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [primaryContainer, primaryContainer.withOpacity(0.4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [0.6, 1.0],
  ),
  borderRadius: BorderRadius.circular(20.0),
);
