import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/images.dart';

//list of settings
List<String> settingList = <String>[
  'Optional',
  'Custom',
  'Advanced',
  'Defualt'
];

class AdvanceSettingDropdown extends StatefulWidget {
  const AdvanceSettingDropdown({super.key});

  @override
  State<AdvanceSettingDropdown> createState() => _AdvanceSettingDropdownState();
}

class _AdvanceSettingDropdownState extends State<AdvanceSettingDropdown> {
  String dropdownValue = settingList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffF5F5F5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            ConstImages.tune,
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
            items: settingList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Advanced Setting",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text("($value)",
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
