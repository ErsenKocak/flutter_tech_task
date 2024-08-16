import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizedBoxExtension on num {
  SizedBox get sbxh => SizedBox(height: h);
  SizedBox get sbxw => SizedBox(width: w);
}
