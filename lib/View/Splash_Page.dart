import 'package:anime/Constant/Themes.dart';
import 'package:anime/Utils/StringNavigations.dart';
import 'package:anime/View/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        HomePage.route.pushAndReplace(context);
      });
      return () {};
    }, []);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.bottomCenter,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('Asset/Images/peakpx.jpg'))),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CircularProgressIndicator(
                      color: DarkThemesOfApp.textColor,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
