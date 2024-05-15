import 'package:anime/Constant/Themes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Provider/DarkAndLightProvider.dart';

Widget movieListWidget(BuildContext context, dynamic data, dynamic images) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  final darkNotifier = Provider.of<DarkAndLight>(context, listen: true);
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      width: width * 0.3,
      height: height * 0.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 1.5,
                color: darkNotifier.isDark
                    ? LightThemeOfApp.secondaryColor
                    : DarkThemesOfApp.textColor,
                offset: const Offset(0.5, 0.9),
                blurStyle: BlurStyle.outer)
          ],
          border: Border.all(
              color: darkNotifier.isDark
                  ? LightThemeOfApp.textColor
                  : DarkThemesOfApp.textColor)),
      child: data != ''
          ? Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: images,
                      child: CachedNetworkImage(
                          imageUrl: images.toString(),
                          width: width,
                          errorWidget: (context, error, stackTrace) {
                            return Center(
                              child: Icon(
                                Icons.info,
                                size: 40.w,
                                color: DarkThemesOfApp.textColor,
                              ),
                            );
                          },
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(data.toString(),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: darkNotifier.isDark
                                ? LightTextStyle.normalStyle
                                : DarkTextStyle.normalStyle),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const SizedBox());
}
