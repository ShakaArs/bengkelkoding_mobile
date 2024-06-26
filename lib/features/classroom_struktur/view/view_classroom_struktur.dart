import 'package:bengkel_koding_mobile/features/classroom_struktur/controller/controller_classroom_struktur.dart';
import 'package:bengkel_koding_mobile/features/home/controller/controller_home.dart';
import 'package:bengkel_koding_mobile/helper/app_appbar.dart';
import 'package:bengkel_koding_mobile/helper/app_listview_lecture.dart';
import 'package:bengkel_koding_mobile/helper/app_listview_student.dart';
import 'package:bengkel_koding_mobile/utils/app_colors_palette.dart';
import 'package:bengkel_koding_mobile/utils/app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../helper/app_card_your_courses.dart';

class ClassStrukturView extends ConsumerStatefulWidget {
  const ClassStrukturView({super.key});

  @override
  _ClassStrukturViewState createState() => _ClassStrukturViewState();
}

class _ClassStrukturViewState extends ConsumerState<ClassStrukturView> {
  String _selectedButton = '/classroom/strukturclassroom';

  void _navigateToPage(String page) {
    setState(() {
      _selectedButton = page;
    });
    context.push(page);
  }

  @override
  Widget build(BuildContext context) {
    final listLecture =
        ref.watch(ListViewLectureController.listLectureProvider);
    final listStudent =
        ref.watch(ListViewStudentController.liststudentProvider);
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 135),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: AppCardYourCourse(
                title: "aasa",
              ),
            ),
            Container(
              width: mediaQueryWidth,
              height: mediaQueryHeight,
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
                                    color: _selectedButton ==
                                            '/classroom/moduldashboard'
                                        ? AppColor.yellowColor
                                        : Colors.transparent,
                                    width: 4.0,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              _navigateToPage('/classroom/moduldashboard');
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
                                    color: _selectedButton ==
                                            '/classroom/strukturclassroom'
                                        ? AppColor.yellowColor
                                        : Colors.transparent,
                                    width: 4.0,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              _navigateToPage('/classroom/strukturclassroom');
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
                    Padding(
                      padding: const EdgeInsets.all(10),
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
                          listLecture.when(
                            data: (data) {
                              final itemCount = data.length;
                              final itemHeight =
                                  70.0; // Adjust based on your item height
                              final containerHeight = itemCount * itemHeight;
                              return Container(
                                width: mediaQueryWidth,
                                height: containerHeight,
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
                                child: ListView.builder(
                                  padding: const EdgeInsets.only(top: 0),
                                  itemBuilder: (context, index) {
                                    final lecture = data[index];
                                    return ListViewLecture(
                                      identityCode: lecture.identityCode,
                                      image: lecture.image,
                                      name: lecture.name,
                                      role: lecture.role,
                                    );
                                  },
                                  itemCount: itemCount,
                                  physics:
                                      NeverScrollableScrollPhysics(), // To disable scrolling inside the container
                                ),
                              );
                            },
                            error: (Object error, StackTrace stackTrace) {
                              return Center(
                                child: Text(
                                  'Error: $error',
                                  style: TextStyle(color: Colors.red),
                                ),
                              );
                            },
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
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
                          listStudent.when(
                            data: (data) {
                              final itemCount = data.length;
                              final itemHeight =
                                  90.0; // Adjust based on your item height
                              final containerHeight = itemCount * itemHeight;
                              return Container(
                                width: mediaQueryWidth,
                                height: containerHeight,
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
                                child: ListView.builder(
                                  padding: const EdgeInsets.only(top: 0),
                                  itemBuilder: (context, index) {
                                    final lecture = data[index];
                                    return ListViewStudent(
                                      identityCode: lecture.identityCode,
                                      image: lecture.image,
                                      name: lecture.name,
                                    );
                                  },
                                  itemCount: itemCount,
                                  physics:
                                      NeverScrollableScrollPhysics(), // To disable scrolling inside the container
                                ),
                              );
                            },
                            error: (Object error, StackTrace stackTrace) {
                              return Center(
                                child: Text(
                                  'Error: $error',
                                  style: TextStyle(color: Colors.red),
                                ),
                              );
                            },
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ],
                      ),
                    ),
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
