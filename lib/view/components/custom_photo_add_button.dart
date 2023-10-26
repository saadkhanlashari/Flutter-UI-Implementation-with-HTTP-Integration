import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/images.dart';

class CustomPhotoAddButton extends StatelessWidget {
  const CustomPhotoAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffF5F5F5)),
      child: Row(
        children: [
          Image.asset(
            ConstImages.addphoto,
            height: Get.height * 0.04,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            'Add Photo',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Color(0xff666666)),
          )
        ],
      ),
    );
  }
}
