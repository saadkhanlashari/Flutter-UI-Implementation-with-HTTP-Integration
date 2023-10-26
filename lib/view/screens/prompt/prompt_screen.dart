import 'package:flutter/material.dart';
import 'package:flutter_ui_implementation_with_http_integration/utils/app_constants.dart';
import 'package:get/get.dart';

import '../../../data/api/api_service.dart';
import '../../../utils/images.dart';
import '../../components/advanced_setting_dropdown.dart';
import '../../components/custom_dropdown.dart';
import '../../components/custom_photo_add_button.dart';

class PromptScreen extends StatefulWidget {
  const PromptScreen({super.key});

  @override
  State<PromptScreen> createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  int letterCount1 = 0;
  int letterCount2 = 0;
  List<Widget> items = [];
  List<Widget> widgetList = List<Widget>.generate(
      5,
      (index) => Container(
            margin: const EdgeInsets.only(left: 5),
            height: Get.height * 0.15, // Make sure Get.height is available
            width: Get.width * 0.3, // Make sure Get.width is available
            decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(ConstImages.addphoto)),
              //  color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
          ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF5F5F5)),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          letterCount1 = value.length;
                        });
                      },
                      controller: controller1,
                      maxLines: 2,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          suffix: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: const Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(5)),
                            child: InkWell(
                              onTap: () {
                                controller1.clear();
                                setState(() {
                                  letterCount1 = 0;
                                });
                              },
                              child: Image.asset(
                                ConstImages.close,
                                height: 15,
                                color: const Color(0xff666666),
                              ),
                            ),
                          )),
                    ),
                    Row(
                      children: [
                        Text('$letterCount1/1000'),
                        const Spacer(),
                        Image.asset(
                          ConstImages.bulb,
                          height: Get.height * 0.03,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          ConstImages.recording,
                          height: Get.height * 0.03,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
                child: const Row(
                  children: [
                    CustomPhotoAddButton(),
                    SizedBox(
                      width: 10,
                    ),
                    CustomDropdown(),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF5F5F5)),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          letterCount2 = value.length;
                        });
                      },
                      controller: controller2,
                      maxLines: 1,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          suffix: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: const Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(5)),
                            child: InkWell(
                              onTap: () {
                                controller1.clear();
                                setState(() {
                                  letterCount2 = 0;
                                });
                              },
                              child: Image.asset(
                                ConstImages.close,
                                height: 15,
                                color: const Color(0xff666666),
                              ),
                            ),
                          )),
                    ),
                    Row(
                      children: [
                        Text('$letterCount2/500'),
                        const Spacer(),
                        Image.asset(
                          ConstImages.recording,
                          height: Get.height * 0.03,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Styles',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        color: Color(0xffFA5711),
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xffFA5711),
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ), // images fetch from API and show in horizontal list view
              GetBuilder<ApiService>(
                builder: (contorller) {
                  int selectedIdx = contorller.selectedItemIndex;
                  return SizedBox(
                      height: Get.height * 0.1, // Adjust the height as needed
                      child: ListView.builder(
                        scrollDirection: Axis
                            .horizontal, // Set the scroll direction to horizontal
                        itemCount: contorller.futureAlbum
                            .length, // Replace with the number of containers you want
                        itemBuilder: (BuildContext context, int index) {
                          bool isSelected = index == selectedIdx;
                          return InkWell(
                            onTap: () {
                              contorller.setSelectedItemIndex(index);
                            },
                            child: Container(
                                margin: const EdgeInsets.only(left: 5),
                                width: Get.width * 0.22,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "${AppConstants.domain}${contorller.futureAlbum[index].icon}")),
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    isSelected
                                        ? Image.asset(
                                            ConstImages.check,
                                            height: Get.height * 0.04,
                                          )
                                        : const SizedBox(),
                                    Text(
                                      contorller.futureAlbum[index].name
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                )),
                          );
                        },
                      ));
                },
              ),
              const AdvanceSettingDropdown(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                height: Get.height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                      colors: [Color(0xffE57050), Color(0xffDB2268)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ConstImages.group),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      children: [
                        Text(
                          "Generate",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Watch an AD",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              // grid view having two image container in one row
              GetBuilder<ApiService>(
                builder: (controller) => GridView.builder(
                  physics: ScrollPhysics(),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
