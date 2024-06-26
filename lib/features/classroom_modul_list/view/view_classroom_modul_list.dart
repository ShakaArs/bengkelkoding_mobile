// ignore_for_file: non_constant_identifier_names

import 'package:bengkel_koding_mobile/helper/app_appbar.dart';
import 'package:bengkel_koding_mobile/helper/app_card_level_courses.dart';
import 'package:bengkel_koding_mobile/helper/app_listview_course.dart';
import 'package:bengkel_koding_mobile/utils/app_colors_palette.dart';
import 'package:bengkel_koding_mobile/utils/app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClassModulListView extends StatelessWidget {
  const ClassModulListView({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: MediaQueryHeight * 0.18),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: AppWeCardLevelCourses(),
            ),
            Container(
              width: MediaQueryWidth,
              height: MediaQueryHeight,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: AppColor.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 17),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  return AppColor.whiteColor;
                                },
                              ),
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered) ||
                                      states.contains(MaterialState.pressed)) {
                                    return AppColor.whiteColor;
                                  }
                                  return AppColor.whiteColor;
                                },
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  side: BorderSide(
                                    color: AppColor.yellowColor,
                                    width: 4.0,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              context.push("/classroom/moduldashboard");
                            },
                            child: Text(
                              'Modul Kelas',
                              style: AppTextStyle.textStyle(
                                size: 12.0,
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  return Colors.white;
                                },
                              ),
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered) ||
                                      states.contains(MaterialState.pressed)) {
                                    return Colors.transparent;
                                  }
                                  return AppColor.yellowColor;
                                },
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  side: BorderSide(
                                    color: AppColor.yellowColor,
                                    width: 4.0,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              context.push("/classroom/strukturclassroom");
                            },
                            child: Text(
                              'Struktur Kelas',
                              style: AppTextStyle.textStyle(
                                size: 12.0,
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    GestureDetector(
                      onTap: () => context.push(
                          "/classroom/moduldashboard/modullist/detailmodul"),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: MediaQueryHeight * 0.8,
                          child: ListView.builder(
                            padding: const EdgeInsets.only(top: 0),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return const ListViewCourse();
                            },
                            itemCount: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
