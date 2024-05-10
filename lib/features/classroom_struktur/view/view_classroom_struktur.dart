// ignore_for_file: non_constant_identifier_names

import 'package:bengkel_koding_mobile/helper/app_listview_lecture.dart';
import 'package:bengkel_koding_mobile/helper/app_listview_student.dart';
import 'package:bengkel_koding_mobile/helper/navbar_bottom.dart';
import 'package:bengkel_koding_mobile/utils/app_colors_palette.dart';
import 'package:bengkel_koding_mobile/utils/app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../helper/app_card_your_courses.dart';

class ClassStrukturView extends StatelessWidget {
  const ClassStrukturView({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQueryHeight * 0.18),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/image/header_bengkod.png',
                  fit: BoxFit.cover,
                  width: 150,
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQueryHeight * 0.35,
                            child: Text('Hi, Fannan Gantengckcokcokc',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: AppTextStyle.textStyle(
                                  size: 24,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.whiteColor,
                                )),
                          ),
                          const SizedBox(height: 2), // Jarak antara dua teks
                          Text(
                            'Ayo Kembangkan bakat kodingmu',
                            style: AppTextStyle.textStyle(
                              size: 12,
                              color: AppColor.whiteColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Transform.scale(
                          scale: 1.80,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade400,
                            backgroundImage: const AssetImage(
                                "assets/image/profile_picture.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: AppCardYourCourse(),
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
                              context.push("/moduldashboard");
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
                    Padding(
                      padding: const EdgeInsets.all(17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Tim Pengajar",
                            style: AppTextStyle.textStyle(
                              size: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColor.whiteColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                              width: MediaQueryWidth,
                              height: 280,
                              decoration: BoxDecoration(
                                color: AppColor.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 2),
                                    color:
                                        AppColor.blackColor.withOpacity(0.25),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: SizedBox(
                                height: MediaQueryHeight * 0.23,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return const ListViewLecture();
                                  },
                                  itemCount: 4,
                                ),
                              )),
                          const SizedBox(height: 10),
                          Text(
                            "Anggota Kelas - M01",
                            style: AppTextStyle.textStyle(
                              size: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColor.whiteColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                              width: MediaQueryWidth,
                              height: 250,
                              decoration: BoxDecoration(
                                color: AppColor.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 2),
                                    color:
                                        AppColor.blackColor.withOpacity(0.25),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: SizedBox(
                                height: MediaQueryHeight * 0.23,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return const ListViewStudent();
                                  },
                                  itemCount: 4,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
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
