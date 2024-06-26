import 'package:flutter/material.dart';
import 'package:bengkel_koding_mobile/utils/app_colors_palette.dart';
import 'package:flutter/widgets.dart';

class CustomCourseCard extends StatelessWidget {
  String? title = "";
  String? descriptionCourse = "";
  String? progress = "";
  CustomCourseCard({
    super.key,
    required this.title,
    required this.descriptionCourse,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.blueGradientWhite,
        border: Border.all(
          color: AppColor.secondPrimaryColor,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/image/image_course1.png',
              width: 100,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondPrimaryColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    descriptionCourse!,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        progress!,
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColor.blackColor,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Stack(
                        children: [
                          Container(
                            height: 10,
                            width: MediaQueryWidth * 0.5, // Lebar progress bar
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(
                                  217, 217, 217, 1), // Warna sisa progress
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            height: 10,
                            width: MediaQueryWidth *
                                0.25, // Ubah lebar progress sesuai dengan persentase
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColor.secondPrimaryColor, // Warna progress
                                  AppColor.primaryColor, // Warna progress
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
