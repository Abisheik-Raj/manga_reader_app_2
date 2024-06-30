import "package:flutter/material.dart";
import "package:manga_reader_app_2/resources/app_colors.dart";

BoxDecoration scaffoldDecoration = BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: const [0.1, 0.3, 0.6, 0.9],
  colors: AppColors.scaffoldColors,
));
