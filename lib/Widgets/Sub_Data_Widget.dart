import 'package:anime/Constant/Themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Provider/DarkAndLightProvider.dart';

Widget detailsSubData(
  BuildContext context,
  dynamic data,
) {
  final darkNotifier = Provider.of<DarkAndLight>(context, listen: true);
  return ListView(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    children: [
      SizedBox(height: 10.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("approved",
              style: darkNotifier.isDark
                  ? LightTextStyle.normalStyle
                  : DarkTextStyle.normalStyle),
          data['approved'] == true
              ? Icon(
                  Icons.done_all_sharp,
                  size: 25.sp,
                  color: Colors.blue,
                )
              : const SizedBox()
        ],
      ),
      SizedBox(height: 10.h),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(data['duration'] ?? "",
              style: darkNotifier.isDark
                  ? LightTextStyle.normalStyle
                  : DarkTextStyle.normalStyle),
          Text(data['rating'] ?? "",
              style: darkNotifier.isDark
                  ? LightTextStyle.normalStyle
                  : DarkTextStyle.normalStyle),
        ],
      ),
      SizedBox(height: 20.h),
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Score : ',
                        style: darkNotifier.isDark
                            ? LightTextStyle.normalStyle
                            : DarkTextStyle.normalStyle),
                    Text(
                        data['score'] == null ? '00' : data['score'].toString(),
                        style: darkNotifier.isDark
                            ? LightTextStyle.normalStyle
                            : DarkTextStyle.normalStyle),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Text('Rank : ',
                        style: darkNotifier.isDark
                            ? LightTextStyle.normalStyle
                            : DarkTextStyle.normalStyle),
                    Text(data['rank'] == null ? '00' : data['rank'].toString(),
                        style: darkNotifier.isDark
                            ? LightTextStyle.normalStyle
                            : DarkTextStyle.normalStyle),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('popularity : ',
                        style: darkNotifier.isDark
                            ? LightTextStyle.normalStyle
                            : DarkTextStyle.normalStyle),
                    Text(
                        data['popularity'] == null
                            ? '00'
                            : data['popularity'].toString(),
                        style: darkNotifier.isDark
                            ? LightTextStyle.normalStyle
                            : DarkTextStyle.normalStyle),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Text('members : ',
                        style: darkNotifier.isDark
                            ? LightTextStyle.normalStyle
                            : DarkTextStyle.normalStyle),
                    Text(
                        data['members'] == null
                            ? '00'
                            : data['members'].toString(),
                        style: darkNotifier.isDark
                            ? LightTextStyle.normalStyle
                            : DarkTextStyle.normalStyle),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      SizedBox(height: 10.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            size: 25.w,
            color: Colors.red,
          ),
          SizedBox(width: 5.h),
          Text(data['favorites'] == null ? '00' : data['favorites'].toString(),
              style: darkNotifier.isDark
                  ? LightTextStyle.normalStyle
                  : DarkTextStyle.normalStyle),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: data['background'] == null
            ? const SizedBox()
            : Text(
                "background : ${data['background'].toString()}",
                textAlign: TextAlign.justify,
                style: darkNotifier.isDark
                    ? LightTextStyle.normalStyle.copyWith(
                        fontSize: 14.sp,
                        letterSpacing: 2,
                      )
                    : DarkTextStyle.normalStyle.copyWith(
                        fontSize: 14.sp,
                        letterSpacing: 2,
                      ),
              ),
      ),
    ],
  );
}
