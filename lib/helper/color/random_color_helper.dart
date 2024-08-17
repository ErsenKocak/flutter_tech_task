import 'dart:math';

import 'package:flutter_tech_task/core/constants/colors/app_light_colors.dart';
import 'package:flutter_tech_task/helper/color/color_schema_entity.dart';

class RandomColorHelper {
  static List<ColorSchemaEntity> colorSchemas = [
    ColorSchemaEntity(
      containerColor: AppLightColors.purple60,
      contentColor: AppLightColors.purple,
    ),
    ColorSchemaEntity(
      containerColor: AppLightColors.blue60,
      contentColor: AppLightColors.blue,
    ),
    ColorSchemaEntity(
      containerColor: AppLightColors.pink60,
      contentColor: AppLightColors.pink,
    ),
    ColorSchemaEntity(
      containerColor: AppLightColors.green60,
      contentColor: AppLightColors.green,
    ),
    ColorSchemaEntity(
      containerColor: AppLightColors.yellow60,
      contentColor: AppLightColors.yellow,
    ),
    ColorSchemaEntity(
      containerColor: AppLightColors.slateBlue60,
      contentColor: AppLightColors.slateBlue,
    ),
    ColorSchemaEntity(
      containerColor: AppLightColors.dark600,
      contentColor: AppLightColors.dark1000,
    ),
    ColorSchemaEntity(
      containerColor: AppLightColors.turqoiseBlue60,
      contentColor: AppLightColors.turqoiseBlue,
    ),
    ColorSchemaEntity(
      containerColor: AppLightColors.gulfBlue60,
      contentColor: AppLightColors.gulfBlue,
    ),
  ];

  static ColorSchemaEntity get getRandomColorSchema {
    Random rnd = new Random();
    int min = 0;
    int max = colorSchemas.length - 1;
    int randomValue = min + rnd.nextInt(max - min);

    return colorSchemas[randomValue];
  }
}
