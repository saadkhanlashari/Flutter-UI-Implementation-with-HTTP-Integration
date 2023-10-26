import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/api_service.dart';
import '../../../utils/app_constants.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: // grid view having two image container in one row
          GetBuilder<ApiService>(
        builder: (controller) => GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          scrollDirection:
              Axis.vertical, // Set the scroll direction to horizontal
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 3, crossAxisSpacing: 3,
            crossAxisCount: 2, // Display 2 items in one row
          ),
          itemCount: controller.futureAlbum.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(left: 5),
              width: Get.width * 0.22,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "${AppConstants.domain}${controller.futureAlbum[index].icon}"),
                ),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        ),
      ),
    );
  }
}
