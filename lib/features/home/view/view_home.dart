import 'package:bengkel_koding_mobile/helper/app_appbar.dart';
import 'package:bengkel_koding_mobile/helper/app_card_assignment.dart';
import 'package:bengkel_koding_mobile/helper/app_card_we_courses.dart';
import 'package:bengkel_koding_mobile/helper/navbar_bottom.dart';
import 'package:bengkel_koding_mobile/helper/app_card_courses.dart';
import 'package:bengkel_koding_mobile/helper/app_card_mentor.dart';
import 'package:bengkel_koding_mobile/utils/app_colors_palette.dart';
import 'package:bengkel_koding_mobile/utils/app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../helper/app_card_your_courses.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    // ignore: non_constant_identifier_names
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: MediaQueryWidth,
          height: MediaQueryHeight,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: MediaQueryHeight * 0.15),
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Text(
                  "Kursus Kami",
                  style: AppTextStyle.textStyle(
                    size: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: MediaQueryHeight * 0.23,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const AppWeCardCourses();
                    },
                    itemCount: 3,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Kursus Yang Kamu Ikuti",
                  style: AppTextStyle.textStyle(
                    size: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () => context.push("/classroom"),
                  child: const AppCardYourCourse(),
                ),
                const SizedBox(height: 15),
                Text(
                  "Mentor Bengkel Koding",
                  style: AppTextStyle.textStyle(
                    size: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                ),
                SizedBox(
                  height: MediaQueryHeight * 0.23,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 0),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const AppCardMentor();
                    },
                    itemCount: 8,
                  ),
                ),
                Text(
                  'Kursus Yang Sedang dikerjakan',
                  style: AppTextStyle.textStyle(
                    size: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: MediaQueryHeight * 0.35,
                  child: ListView(
                    padding: const EdgeInsets.only(top: 0),
                    children: const [
                      CustomCourseCard(),
                      CustomCourseCard(),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Penugasan Terbaru",
                  style: AppTextStyle.textStyle(
                    size: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackColor,
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () => context.push("/assignment"),
                  child: SizedBox(
                    height: MediaQueryHeight * 0.25,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 0),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return const CustomAssignmentCard();
                      },
                      itemCount: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const NavbarBottom(),
      ),
    );
  }
}
