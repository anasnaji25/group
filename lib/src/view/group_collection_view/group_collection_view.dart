import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group/src/const/colors.dart';
import 'package:group/src/const/fonts.dart';
import 'package:group/src/model/group_model/group_model.dart';
import 'package:group/src/view/group_collection_view/add_new_member_view.dart';
import 'package:group/src/widgets/user_cards.dart';

import '../../controllers/groups_controller.dart';

class GroupCollectionView extends StatefulWidget {
  GroupModel groupData;

  GroupCollectionView({required this.groupData});

  @override
  State<GroupCollectionView> createState() => _GroupCollectionViewState();
}

class _GroupCollectionViewState extends State<GroupCollectionView> {
  final groupController = Get.find<GroupsController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Group Loan Collection",
                    style: roboto.copyWith(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: size.height * 0.85,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Group Name",
                                        style: roboto.copyWith(
                                            color: Colors.black45,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            widget.groupData.groupName,
                                            style: roboto.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "(0 Members)",
                                            style: roboto.copyWith(
                                                color: Colors.blue,
                                                fontSize: 13),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => AddNewMemberView());
                                        },
                                        child: Container(
                                          height: 35,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Add New Member",
                                            style: roboto.copyWith(
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Collected:₹0.00",
                                        style: roboto.copyWith(
                                            color: Colors.black45,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "₹33,150.00",
                                        style: roboto.copyWith(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Count:0/31",
                                        style: roboto.copyWith(
                                            color: Colors.black45,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ), //end of heading dash
                        const SizedBox(
                          height: 15,
                        ),
                        GetBuilder<GroupsController>(
                            builder: (_) => Container(
                                  height: 400,
                                  child: ListView.builder(
                                      itemCount:
                                          groupController.listOfCustomer.length,
                                      itemBuilder: (context, index) {
                                        return UserCards(
                                          name: "B Jannath nasreen",
                                          cifnumber: "200003518574",
                                          installment: "1,390.00",
                                          ourtstanding: "55,390.00",
                                        );
                                      }),
                                )),
                        // UserCards(
                        //   name: "B Jannath nasreen",
                        //   cifnumber: "200003518574",
                        //   installment: "1,390.00",
                        //   ourtstanding: "55,390.00",
                        // ),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        // UserCards(
                        //   name: "Bathmini",
                        //   cifnumber: "18003518574",
                        //   installment: "935.00",
                        //   ourtstanding: "75,390.00",
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
