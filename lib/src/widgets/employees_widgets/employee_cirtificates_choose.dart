import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group/src/const/fonts.dart';
import 'package:group/src/controllers/employee_controller.dart';

void chooseEmpCirtificatesPhotoBottomSheet(BuildContext context) {
  final employeeController = Get.find<EmployeeController>();
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
            height: 200.0,
            color: Colors.blue[900],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: Text("Choose a picture",
                      style: roboto.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              var image = await employeeController
                                  .chooseImageFromCamera();
                              employeeController.employeeCirtificates
                                  .add(image!.path);
                              employeeController.update();
                            },
                            child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.blue[900],
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 1),
                                          blurRadius: 4,
                                          color: Colors.grey.withOpacity(0.5))
                                    ]),
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                )),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "camera",
                            style: roboto.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              var image = await employeeController
                                  .selectMultipleImages();

                              for (var i = 0; i < image!.length; i++) {
                                employeeController.employeeCirtificates
                                    .add(image[i].path);
                              }
                              employeeController.update();
                            },
                            child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.blue[900],
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 1),
                                          blurRadius: 4,
                                          color: Colors.grey.withOpacity(0.5))
                                    ]),
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.image,
                                  color: Colors.white,
                                )),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "gallery",
                            style: roboto.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ));
      });
}
