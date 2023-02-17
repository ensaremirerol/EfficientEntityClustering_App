import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = StateProvider<Brightness>((ref) {
  return themeString == 'dark' ? Brightness.dark : Brightness.light;
});

String? themeString;
