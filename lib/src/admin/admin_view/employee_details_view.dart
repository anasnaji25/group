import 'package:flutter/material.dart';
import 'package:group/src/const/fonts.dart';
import 'package:group/src/model/get_eployeemodel.dart';

class EmployeeDetailsView extends StatefulWidget {
  GetEmployeeModel employee;
  EmployeeDetailsView({required this.employee});

  @override
  State<EmployeeDetailsView> createState() => _EmployeeDetailsViewState();
}

class _EmployeeDetailsViewState extends State<EmployeeDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      widget.employee.employeePhoto,
                      fit: BoxFit.fill,
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.employee.fullName,
                    style: roboto.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${widget.employee.gender}, ${widget.employee.age}",
                    style: roboto.copyWith(fontSize: 13, color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.employee.designation,
                    style: roboto.copyWith(fontSize: 16, color: Colors.black45),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.employee.address,
                  style: roboto.copyWith(),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                const Icon(
                  Icons.call,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.employee.mobileNumber,
                      style: roboto.copyWith(),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.employee.alternativeMobile,
                      style: roboto.copyWith(),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                const Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.employee.email,
                  style: roboto.copyWith(),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                const Text("DOB",
                    style: TextStyle(fontSize: 15, color: Colors.grey)),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.employee.dateofBirth,
                  style: roboto.copyWith(),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Text(
              "Documents",
              style: roboto.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Aadhar card number : ${widget.employee.aadharCardNumber}",
                      style: roboto.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Download",
                    style: roboto.copyWith(color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
         const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Pan card number       : ${widget.employee.panCardNumber}",
                      style: roboto.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Download",
                    style: roboto.copyWith(color: Colors.blue),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
