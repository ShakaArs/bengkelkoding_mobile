import 'package:bengkel_koding_mobile/helper/app_appbar.dart';
import 'package:bengkel_koding_mobile/helper/app_card_courses.dart';
import 'package:bengkel_koding_mobile/helper/app_card_dropdown_information.dart';

import 'package:bengkel_koding_mobile/helper/app_card_your_courses.dart';
import 'package:bengkel_koding_mobile/helper/navbar_bottom.dart';
import 'package:bengkel_koding_mobile/utils/app_colors_palette.dart';
import 'package:bengkel_koding_mobile/utils/app_font_styles.dart';
import 'package:flutter/material.dart';

class ClassModulDashboard extends StatelessWidget {
  const ClassModulDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: MediaQueryHeight * 0.18),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: AppCardYourCourse(),
              ),
              SizedBox(
                width: MediaQueryWidth,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: AppColor.primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(17),
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
                                      if (states.contains(
                                              MaterialState.hovered) ||
                                          states.contains(
                                              MaterialState.pressed)) {
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
                                onPressed: () {},
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
                                      if (states.contains(
                                              MaterialState.hovered) ||
                                          states.contains(
                                              MaterialState.pressed)) {
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
                                onPressed: () {},
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "INFORMASI KELAS",
                              style: AppTextStyle.textStyle(
                                size: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColor.whiteColor,
                              ),
                            ),
                            const SizedBox(height: 15),
                            ListView.separated(
                              padding: const EdgeInsets.only(top: 0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return const AppCardInformation();
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 20),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "DAFTAR KURSUS",
                              style: AppTextStyle.textStyle(
                                size: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColor.whiteColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: MediaQueryHeight * 0.32,
                              child: ListView.builder(
                                padding: const EdgeInsets.only(top: 0),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return const CustomCourseCard();
                                },
                                itemCount: 3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const NavbarBottom(),
      ),
    );
  }
}