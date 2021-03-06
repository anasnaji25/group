import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group/src/admin/admin_view/admin_dashboard_view.dart';
import 'package:group/src/const/colors.dart';
import 'package:group/src/controllers/groups_controller.dart';
import 'package:group/src/model/group_model/group_model.dart';
import 'package:group/src/view/group_collection_view/group_collection_view.dart';
import 'package:group/src/view/home_view/home_page.dart';

import '../../const/fonts.dart';

class TaskScreenView extends StatefulWidget {
  TaskScreenView({Key? key}) : super(key: key);

  @override
  State<TaskScreenView> createState() => _TaskScreenViewState();
}

class _TaskScreenViewState extends State<TaskScreenView> {
  final groupController = Get.find<GroupsController>();

  @override
  void initState() {
    super.initState();
    print(">>>>>>>>>>>>>>>>>>>>>>>>>");

    getList();
    print(">>>>>>>>>>>>>>>>>>>>>>>>>");
  }

  getList() async {
    print("gt list .,.");
    groupController.getGroupsList();
    // groupController.getGroupsList2();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Task",
              style: roboto.copyWith(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              width: size.width,
              height: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Task List",
                                  style: roboto.copyWith(
                                      color: Colors.blue[800],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "20/04/2022",
                                  style: roboto.copyWith(
                                      color: Colors.black45, fontSize: 12),
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                              child: Text(
                                "Demand File",
                                style: roboto.copyWith(
                                  color: Colors.blue[800],
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 230,
                        child: GetBuilder<GroupsController>(
                            builder: (_) => ListView.builder(
                                shrinkWrap: true,
                                itemCount: groupController.listOfGroups.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              groupController
                                                  .listOfGroups[index]
                                                  .groupName,
                                              style: roboto.copyWith(
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.to(() =>
                                                    GroupCollectionView(
                                                      groupData: groupController
                                                          .listOfGroups[index],
                                                    ));
                                              },
                                              child: Text(
                                                "0(Members)",
                                                style: roboto.copyWith(
                                                    color: Colors.blue,
                                                    decoration: TextDecoration
                                                        .underline),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "???0.00",
                                                  style: roboto.copyWith(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Collected:???0.00",
                                                  style: roboto.copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 12),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.watch_later_rounded,
                                              color: Colors.yellow[600],
                                              size: 20,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                })),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 237, 237),
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Total to be collected",
                            style: roboto.copyWith(),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "??? 1,24,865.00",
                                style: roboto.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Collected:???0.00",
                                style: roboto.copyWith(
                                    color: Colors.black45, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
        child: Container(
          height: 150,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Quick Links",
                  style: roboto.copyWith(
                      color: Colors.blue[700],
                      decoration: TextDecoration.underline),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.compare_arrows_sharp,
                          color: primaryColor,
                          size: 40,
                        ),
                        Text(
                          'Transfer',
                          style: roboto.copyWith(fontSize: 11),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.adf_scanner,
                          color: primaryColor,
                          size: 40,
                        ),
                        Text(
                          'Withdrawal',
                          style: roboto.copyWith(fontSize: 11),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: primaryColor,
                          size: 40,
                        ),
                        Text(
                          'Balance\nEquity',
                          textAlign: TextAlign.center,
                          style: roboto.copyWith(fontSize: 11),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          CupertinoIcons.doc_text_fill,
                          color: primaryColor,
                          size: 40,
                        ),
                        Text(
                          'Report',
                          style: roboto.copyWith(fontSize: 11),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          CupertinoIcons.hand_thumbsup_fill,
                          color: primaryColor,
                          size: 40,
                        ),
                        Text(
                          'Direct Loan\nPay',
                          textAlign: TextAlign.center,
                          style: roboto.copyWith(fontSize: 11),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
