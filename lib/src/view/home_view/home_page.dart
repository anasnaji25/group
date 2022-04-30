import 'package:flutter/material.dart';
import 'package:group/src/const/colors.dart';
import 'package:group/src/const/fonts.dart';
import 'package:group/src/widgets/user_cards.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                                            "Sky",
                                            style: roboto.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            " (31Members)",
                                            style: roboto.copyWith(
                                                color: Colors.blue,
                                                fontSize: 13),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 35,
                                        width: 190,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black45),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, top: 3),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Total",
                                                    style: roboto.copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 11),
                                                  ),
                                                  Text(
                                                    "31",
                                                    style: roboto.copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 1,
                                              color: Colors.black45,
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, top: 3),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "A",
                                                    style: roboto.copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 11),
                                                  ),
                                                  Text(
                                                    "30",
                                                    style: roboto.copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            Container(
                                              width: 1,
                                              color: Colors.black45,
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, top: 3),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "B",
                                                    style: roboto.copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 11),
                                                  ),
                                                  Text(
                                                    "1",
                                                    style: roboto.copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            Container(
                                              width: 1,
                                              color: Colors.black45,
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, top: 3),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "C",
                                                    style: roboto.copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 11),
                                                  ),
                                                  Text(
                                                    "0",
                                                    style: roboto.copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            Container(
                                              width: 1,
                                              color: Colors.black45,
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, top: 3),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "D",
                                                    style: roboto.copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 11),
                                                  ),
                                                  Text(
                                                    "0",
                                                    style: roboto.copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            Container(
                                              width: 1,
                                              color: Colors.black45,
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, top: 3),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "N",
                                                    style: roboto.copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 11),
                                                  ),
                                                  Text(
                                                    "0",
                                                    style: roboto.copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            Container(
                                              width: 1,
                                              color: Colors.black45,
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, top: 3),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "R",
                                                    style: roboto.copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 11),
                                                  ),
                                                  Text(
                                                    "0",
                                                    style: roboto.copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                          ],
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
                        UserCards(
                          name: "B Jannath nasreen",
                          cifnumber: "200003518574",
                          installment: "1,390.00",
                          ourtstanding: "55,390.00",
                        ),
                         const SizedBox(
                          height: 15,
                        ),
                        UserCards(
                          name: "Bathmini",
                          cifnumber: "18003518574",
                          installment: "935.00",
                          ourtstanding: "75,390.00",
                        ),
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
