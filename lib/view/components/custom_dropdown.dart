import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/images.dart';
import '../dashboard/dashboard_screen.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String dropdownValue = sizeList.first;

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
            ConstImages.imagesize,
            height: Get.height * 0.04,
          ),
          const SizedBox(
            width: 5,
          ),
          DropdownButton<String>(
            underline: const SizedBox(),
            value: dropdownValue,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Color(0xff666666),
            ),
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Color(0xff666666)),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: sizeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
