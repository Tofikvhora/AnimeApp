import 'package:anime/Constant/Themes.dart';
import 'package:anime/Provider/ApiProvider.dart';
import 'package:anime/Provider/DarkAndLightProvider.dart';
import 'package:anime/View/Details_Page.dart';
import 'package:anime/Widgets/Movie_List_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends HookWidget {
  static const String route = 'HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<ApiProvider>(context, listen: false);
    final darkNotifier = Provider.of<DarkAndLight>(context, listen: true);
    useEffect(() {
      notifier.fetchData('', context);
      return () {};
    }, []);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textController = useTextEditingController();
    return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size(20, 80),
            child: Consumer<DarkAndLight>(
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Search Anime By Name",
                      style: value.isDark
                          ? DarkTextStyle.normalStyle
                          : LightTextStyle.normalStyle,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: SizedBox(
                        width: width * 0.9,
                        height: height * 0.07,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: textController,
                          onFieldSubmitted: (value) {
                            if (textController.value.text.isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: const Text(
                                  "Field Can't be empty",
                                ),
                                backgroundColor: DarkThemesOfApp.secondaryColor,
                              ));
                            } else {
                              notifier.fetchData(value, context);
                              textController.clear();
                            }
                          },
                          style: value.isDark
                              ? DarkTextStyle.normalStyle
                              : LightTextStyle.normalStyle,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    if (textController.value.text.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: const Text(
                                          "Field Can't be empty",
                                        ),
                                        backgroundColor:
                                            DarkThemesOfApp.secondaryColor,
                                      ));
                                    } else {
                                      String data = textController.value.text;
                                      notifier.fetchData(data, context);
                                      textController.clear();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.search,
                                    color: value.isDark
                                        ? DarkThemesOfApp.textColor
                                        : LightThemeOfApp.secondaryColor,
                                  )),
                              hintText: 'Ex : Naruto',
                              hintStyle: value.isDark
                                  ? DarkTextStyle.normalStyle
                                      .copyWith(fontWeight: FontWeight.w400)
                                  : LightTextStyle.normalStyle
                                      .copyWith(fontWeight: FontWeight.w400),
                              border: OutlineInputBorder(
                                  gapPadding: 20,
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: value.isDark
                                          ? LightThemeOfApp.textColor
                                          : DarkThemesOfApp.secondaryColor))),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          elevation: 10,
          automaticallyImplyLeading: true,
          primary: true,
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
            "Home",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<ApiProvider>(
            builder: (context, value, child) {
              return value.isLoading == false
                  ? value.apiData.isEmpty
                      ? Center(
                          child: Text(
                            "Movie name not found",
                            style: darkNotifier.isDark
                                ? LightTextStyle.normalStyle
                                : DarkTextStyle.normalStyle,
                          ),
                        )
                      : GridView.builder(
                          itemCount: value.apiData.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.6),
                          itemBuilder: (context, index) {
                            final mainData = value.apiData[index];
                            final data = value.apiData[index]['title'];
                            final images = value.apiData[index]["images"]["jpg"]
                                ["large_image_url"];
                            return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, DetailsPage.route, arguments: {
                                    'data': mainData,
                                    'name': data,
                                    'images': images
                                  });
                                },
                                child: movieListWidget(context, data, images));
                          },
                        )
                  : Center(
                      child: CircularProgressIndicator(
                        color: darkNotifier.isDark
                            ? DarkThemesOfApp.secondaryColor
                            : LightThemeOfApp.textColor,
                      ),
                    );
            },
          ),
        ));
  }
}
