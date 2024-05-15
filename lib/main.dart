import 'package:anime/Constant/Themes.dart';
import 'package:anime/Provider/ApiProvider.dart';
import 'package:anime/Provider/DarkAndLightProvider.dart';
import 'package:anime/View/Splash_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Routes/RoutesOfApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(milliseconds: 100));
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DarkAndLight()),
        ChangeNotifierProvider(create: (context) => ApiProvider()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(350, 680),
        builder: (context, child) {
          return Consumer<DarkAndLight>(
            builder: (context, value, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                onGenerateRoute: RoutesOfApp.genRoutes,
                title: 'Anime',
                theme: ThemeData(
                    fontFamily: 'main',
                    useMaterial3: true,
                    scaffoldBackgroundColor: value.isDark
                        ? LightThemeOfApp.primaryColor
                        : DarkThemesOfApp.primaryColor,
                    appBarTheme: AppBarTheme(
                        iconTheme: value.isDark
                            ? IconThemeData(
                                color: DarkThemesOfApp.boxColor, size: 25)
                            : IconThemeData(
                                color: LightThemeOfApp.secondaryColor,
                                size: 25),
                        titleTextStyle: value.isDark
                            ? TextStyle(
                                color: DarkThemesOfApp.textColor,
                                fontSize: 20.sp,
                                fontFamily: 'main',
                                fontWeight: FontWeight.bold)
                            : TextStyle(
                                color: LightThemeOfApp.secondaryColor,
                                fontSize: 20.sp,
                                fontFamily: 'main',
                                fontWeight: FontWeight.bold),
                        color: value.isDark
                            ? LightThemeOfApp.secondaryColor
                            : DarkThemesOfApp.textColor)),
                home: const SplashPage(),
              );
            },
          );
        },
      ),
    );
  }
}
