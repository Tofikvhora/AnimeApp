import 'package:anime/Constant/Themes.dart';
import 'package:anime/Widgets/Sub_Data_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Provider/DarkAndLightProvider.dart';

class DetailsPage extends HookWidget {
  static const String route = 'DetailsPage';
  final Map data;
  final String images;
  final String name;
  const DetailsPage(
      {super.key,
      required this.data,
      required this.images,
      required this.name});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final darkNotifier = Provider.of<DarkAndLight>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        elevation: 10,
        automaticallyImplyLeading: true,
        actions: [
          Consumer<DarkAndLight>(
            builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: IconButton(
                    onPressed: () => value.darkAndLightFunction(),
                    icon: const Icon(
                      Icons.dark_mode,
                    )),
              );
            },
          )
        ],
        centerTitle: true,
        title: const Text(
          "Anime Details",
        ),
      ),
      body: images.isEmpty || data.isEmpty || name.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 50.w, vertical: 10.h),
                        width: width * 0.5,
                        height: height * 0.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: darkNotifier.isDark
                                      ? LightThemeOfApp.secondaryColor
                                      : DarkThemesOfApp.textColor,
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 5,
                                  offset: const Offset(0.8, 1.5)),
                              BoxShadow(
                                  color: darkNotifier.isDark
                                      ? LightThemeOfApp.secondaryColor
                                      : DarkThemesOfApp.textColor,
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 5,
                                  offset: const Offset(0.5, 2.1)),
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Hero(
                            tag: images,
                            child: Image.network(
                              images,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: darkNotifier.isDark
                                  ? LightTextStyle.normalStyle
                                  : DarkTextStyle.normalStyle,
                            ),
                          ),
                          SizedBox(width: 5.w),
                        ],
                      ),
                      detailsSubData(context, data),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    darkNotifier.urlLaunch(
                        data['trailer']['url'].toString(), context);
                  },
                  child: Container(
                    width: width,
                    height: height * 0.075,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              blurStyle: BlurStyle.outer,
                              offset: const Offset(0.2, 0.8),
                              spreadRadius: 1.2,
                              color: darkNotifier.isDark
                                  ? DarkThemesOfApp.primaryColor
                                  : LightThemeOfApp.primaryColor),
                          BoxShadow(
                              blurRadius: 2,
                              blurStyle: BlurStyle.outer,
                              offset: const Offset(1.2, 2.8),
                              spreadRadius: 0.6,
                              color: darkNotifier.isDark
                                  ? DarkThemesOfApp.primaryColor
                                  : LightThemeOfApp.primaryColor),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: darkNotifier.isDark
                            ? LightThemeOfApp.secondaryColor
                            : DarkThemesOfApp.boxColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset("Asset/Images/icons8-youtube-48.png"),
                              SizedBox(width: 5.w),
                              Text(
                                "watch trailer on youtube",
                                style: darkNotifier.isDark
                                    ? DarkTextStyle.normalStyle
                                        .copyWith(fontSize: 15.sp)
                                    : LightTextStyle.normalStyle
                                        .copyWith(fontSize: 15.sp),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20.w,
                            color: darkNotifier.isDark
                                ? LightThemeOfApp.textColor
                                : DarkThemesOfApp.secondaryColor,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
