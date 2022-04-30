import 'package:flutter/material.dart';
import 'package:group/src/const/colors.dart';

import '../const/fonts.dart';

class UserCards extends StatefulWidget {
  String name;
  String ourtstanding;
  String installment;
  String cifnumber;
  UserCards({
    required this.name,
    required this.cifnumber,
    required this.installment,
    required this.ourtstanding,
  });

  @override
  State<UserCards> createState() => _UserCardsState();
}

class _UserCardsState extends State<UserCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("1"),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.name.toUpperCase(),
                          style: roboto.copyWith(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blue[700]),
                        )
                      ],
                    ),
                    RichText(
                        text: TextSpan(
                            text: "CIF ID:",
                            style: roboto.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Colors.black54),
                            children: [
                          TextSpan(
                              text: widget.cifnumber,
                              style: roboto.copyWith(
                                  color: Colors.black45, fontSize: 11))
                        ]))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black45)),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: const [
                            Text("₹"),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration.collapsed(hintText: ""),
                              ),
                            )
                          ],
                        ),
                      )),
                  Container(
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primaryColor),
                    alignment: Alignment.center,
                    child: Text(
                      "Pay",
                      style: roboto.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(""),
                  Text(
                    "Transaction History",
                    style: roboto.copyWith(
                        color: Colors.blue[700],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1.5,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Column(
                  //   children: [
                  //     Text(
                  //       "Loan Amount",
                  //       style: roboto.copyWith(
                  //           fontSize: 11,
                  //           color: Colors.black45),
                  //     ),
                  //     Text(
                  //       "₹ 65,390.00",
                  //       style: roboto.copyWith(
                  //           fontSize: 13,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.black),
                  //     ),
                  //   ],
                  // ),
                  Column(
                    children: [
                      Text(
                        "Outstanding",
                        style: roboto.copyWith(
                            fontSize: 11, color: Colors.black45),
                      ),
                      Text(
                        "₹ ${widget.ourtstanding}",
                        style: roboto.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Installment Amount",
                        style: roboto.copyWith(
                            fontSize: 11, color: Colors.black45),
                      ),
                      Text(
                        "₹ ${widget.installment}",
                        style: roboto.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Overdue Amount",
                        style: roboto.copyWith(
                            fontSize: 11, color: Colors.black45),
                      ),
                      Text(
                        "₹ 0.00",
                        style: roboto.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
