import 'package:flutter/material.dart';
import 'package:spacera/core/constant/colors.dart';
import 'package:spacera/core/utils/images.dart';

PreferredSizeWidget customAppBar(BuildContext context) {
  return AppBar(
    title: Image.asset(
      Images.spaceXLogo,
      height: 30,
      color: AppColors.white,
    ),
    centerTitle: true,
    elevation: 10.0,
    backgroundColor: AppColors.black,
  );
}
