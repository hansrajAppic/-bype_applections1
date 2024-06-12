// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last, unnecessary_string_interpolations


import 'Globale_class/colors.dart';
import 'demt_screen.dart';
import 'demt_transtion_1.dart';
import 'package:flutter/material.dart';
// ignore: unused_import

import 'package:intl/intl.dart';

class DemtConfrmPay extends StatefulWidget {
  const DemtConfrmPay({super.key});

  @override
  State<DemtConfrmPay> createState() => _DemtFundTransferState();
}

class _DemtFundTransferState extends State<DemtConfrmPay> {
  int checkBox = 1;
  String currentDate =
      DateFormat('EEEEE-dd-MM-yyyy-hh:mm:ss a').format(DateTime.now());
  String todayDate = DateFormat('yMd').format(DateTime.now());

  // ignore: non_constant_identifier_names
  bool Botmcheck = false;
  // ignore: non_constant_identifier_names
  bool Botmcheck2 = false;
  int selectedContainerIndex = -1;
  Color selectedColor = Colors.orange;
  Color unselectedColor = const Color.fromARGB(255, 245, 237, 237);
  List<String> containerItems = [
    'Rent',
    'Selary',
    'Others',
  ];
  bool check1 = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
     backgroundColor: AppColors.whiteColor,
        key: _key,
        drawer: Row(
          children: [
            Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.orange,
                            Colors.red,
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(39),
                        )),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          child: Icon(Icons.person),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor,),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Corporate Id",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.whiteColor,
                                    ),
                                  ),
                                  Text(
                                    "573303418",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    "User ID",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.whiteColor,),
                                  ),
                                  Text(
                                    "USER 1",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("My Profile"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 211, 189, 189),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Change your Login ID"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 211, 189, 189),
                  ),
                  ListTile(
                    leading: const Icon(Icons.arrow_back_ios_new_sharp),
                    title: const Text("Change your Login ID"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 211, 189, 189),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 211, 189, 189),
                  ),
                  ListTile(
                    leading: const Icon(Icons.star_border),
                    title: const Text("Rat Us "),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 211, 189, 189),
                  ),
                  ListTile(
                    leading: const Icon(Icons.shop),
                    title: const Text("FAQs"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 211, 189, 189),
                  ),
                  ListTile(
                    leading: const Icon(Icons.book),
                    title: const Text("Isafe"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 211, 189, 189),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone_callback_rounded),
                    title: const Text("Contact Us"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 211, 189, 189),
                  ),
                  ListTile(
                    leading: const Icon(Icons.bookmark_outline_outlined),
                    title: const Text("Feedback"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 211, 189, 189),
                  ),
                  ListTile(
                    leading: const Icon(Icons.help_outline),
                    title: const Text("Logout"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 211, 189, 189),
                  ),
                ],
              ),
            ),
          ],
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.whiteColor,
          ),
          backgroundColor: const Color.fromARGB(255, 255, 94, 0),
          toolbarHeight: 39,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DemtScreen()));
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    color:AppColors.whiteColor,
                  ),
                ),
                SizedBox(
                  width: w * 0.2,
                ),
                const Text(
                  "Confirem To Pay",
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w400,
                    color:AppColors.whiteColor,
                  ),
                ),
              ]),
          centerTitle: true,
          leadingWidth: w * 0.08,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h * 0.02,
              ),
              const Center(
                child: Text(
                  "You have chosen to make Flowing found",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
              ),
              const Text(
                "transfer Please confirm to proceed.",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Text(
                // ignore: unnecessary_brace_in_string_interps
                "${currentDate}",
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Stack(children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                              color:AppColors.whiteColor,
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 223, 217, 217)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(69, 143, 145, 135),
                                  blurRadius: 4,
                                ),
                              ]),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.035, vertical: h * 0.02),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: h * 0.088,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Payee Name",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 109, 107, 107)),
                                    ),
                                    Text("rrechrecharg",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromARGB(
                                                255, 109, 107, 107)))
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Payee Bank Name",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 109, 107, 107)),
                                    ),
                                    Text(
                                      "IDFC BANK LIMITED",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 109, 107, 107)),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "To Account No.",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 109, 107, 107)),
                                    ),
                                    Text(
                                      "XXXX3507",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 109, 107, 107)),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "From Account No.",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 109, 107, 107)),
                                    ),
                                    Text(
                                      "XXXXXXXX2987",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 109, 107, 107)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Amount No",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 109, 107, 107)),
                                    ),
                                    Text(
                                      "One Hunderds Ruppes \n                            Only",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 109, 107, 107)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: h * 0.0900,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xffFFCCBC),
                                  const Color(0xffFFCCBC).withOpacity(0.1),
                                  const Color.fromARGB(255, 175, 208, 238),
                                ],
                              ),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 223, 217, 217)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(69, 143, 145, 135),
                                  blurRadius: 0,
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColors.whiteColor,
                                maxRadius: 20,
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/phone recharge.png",
                                    height: 20,
                                  ),
                                ),
                              ),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "You are Treansfring",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "₹100",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                  maxRadius: 20,
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 254, 254)
                                          .withOpacity(1.0),
                                  child: Image.asset(
                                    "assets/images/axis bank.png",
                                    height: 27,
                                  )),
                            ],
                          ),
                        )
                      ]),
                      SizedBox(
                        height: h * 0.04,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(bottom: 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffFFFFFF),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(69, 143, 145, 135),
                                blurRadius: 4,
                              ),
                            ]),
                        child: Column(
                          children: [
                            SizedBox(
                              height: h * 0.016,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: w * 0.027,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Payment Type",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff595A76)),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(builder:
                                              (BuildContext context,
                                                  StateSetter bottomState) {
                                            return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom:
                                                        MediaQuery.of(context)
                                                                .viewInsets
                                                                .bottom +
                                                            0,
                                                    top: 0),
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                    context)
                                                                .viewInsets
                                                                .bottom +
                                                            0,
                                                        top: 0),
                                                    child: Container(
                                                        height: h * 0.53,
                                                        width: double.infinity,
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 18,
                                                            ),
                                                            child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <Widget>[
                                                                  SizedBox(
                                                                    height: h *
                                                                        0.02,
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      child:
                                                                          const Icon(
                                                                        Icons
                                                                            .clear,
                                                                        size:
                                                                            17,
                                                                        color: Colors
                                                                            .black54,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const Center(
                                                                    child: Text(
                                                                      "Payment Type",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          fontSize:
                                                                              18,
                                                                          color:
                                                                              Color(0xff595A76)),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: h *
                                                                        0.03,
                                                                  ),
                                                                  Container(
                                                                    height: h *
                                                                        0.07,
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(22),
                                                                            border: Border.all(
                                                                              color: const Color.fromARGB(255, 216, 209, 209),
                                                                            )),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              w * 0.025),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          CircleAvatar(
                                                                            backgroundColor:
                                                                                const Color(0xffE2E1DB),
                                                                            maxRadius:
                                                                                15,
                                                                            child:
                                                                                Icon(
                                                                              Icons.stars,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                w * 0.05,
                                                                          ),
                                                                          const Text(
                                                                            "IMPS",
                                                                            style:
                                                                                TextStyle(fontSize: 17, color: Colors.black),
                                                                          ),
                                                                          const Spacer(),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                bottomState(() {
                                                                                  checkBox = 1;
                                                                                });
                                                                              });
                                                                            },
                                                                            child: checkBox == 1
                                                                                ? const CircleAvatar(
                                                                                    maxRadius: 11,
                                                                                    backgroundColor: Colors.green,
                                                                                    child: Icon(
                                                                                      Icons.check,
                                                                                      size: 18,
                                                                                      color: AppColors.whiteColor,
                                                                                    ),
                                                                                  )
                                                                                : Container(
                                                                                    height: 22,
                                                                                    width: 22,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                      border: Border.all(color: Colors.grey, width: 2),
                                                                                    ),
                                                                                  ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: h *
                                                                        0.02,
                                                                  ),
                                                                  Container(
                                                                    height: h *
                                                                        0.07,
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(22),
                                                                            border: Border.all(
                                                                              color: const Color.fromARGB(255, 216, 209, 209),
                                                                            )),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              w * 0.025),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          CircleAvatar(
                                                                            backgroundColor:
                                                                                const Color(0xffE2E1DB),
                                                                            maxRadius:
                                                                                15,
                                                                            child:
                                                                                Icon(
                                                                              Icons.stars,
                                                                            ),
                                                                            //   Center(
                                                                            // child: Image.asset(
                                                                            //    "assets/images/axis bank.png",
                                                                            //   height: 18,
                                                                            // ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                w * 0.05,
                                                                          ),
                                                                          const Text(
                                                                            "NEFT",
                                                                            style:
                                                                                TextStyle(fontSize: 17, color: Colors.black),
                                                                          ),
                                                                          const Spacer(),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                bottomState(() {
                                                                                  checkBox = 2;
                                                                                });
                                                                              });
                                                                            },
                                                                            child: checkBox == 2
                                                                                ? const CircleAvatar(
                                                                                    maxRadius: 11,
                                                                                    backgroundColor: Colors.green,
                                                                                    child: Icon(
                                                                                      Icons.check,
                                                                                      size: 18,
                                                                                      color: AppColors.whiteColor,
                                                                                    ),
                                                                                  )
                                                                                : Container(
                                                                                    height: 22,
                                                                                    width: 22,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                      border: Border.all(color: Colors.grey, width: 2),
                                                                                    ),
                                                                                  ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: h *
                                                                        0.028,
                                                                  ),
                                                                  Container(
                                                                    height: h *
                                                                        0.079,
                                                                    width: double
                                                                        .infinity,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(8),
                                                                        color: const Color(0xffE4D8CC),
                                                                        border: Border.all(
                                                                          color:
                                                                              const Color(0xffE4D8CC),
                                                                        )),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.symmetric(horizontal: w * 0.03),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              SizedBox(
                                                                                height: h * 0.033,
                                                                              ),
                                                                              const Icon(
                                                                                Icons.error,
                                                                                size: 16,
                                                                                color: Colors.deepOrange,
                                                                              ),
                                                                              SizedBox(
                                                                                width: w * 0.02,
                                                                              ),
                                                                              const Text(
                                                                                "To know about transaction Timaings & ",
                                                                                style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 109, 107, 107)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              SizedBox(
                                                                                width: w * 0.036,
                                                                              ),
                                                                              const Text(
                                                                                "Charges ",
                                                                                style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 109, 107, 107)),
                                                                              ),
                                                                              const Text(
                                                                                "Click Here",
                                                                                style: TextStyle(fontSize: 12, color: Colors.deepOrange, decoration: TextDecoration.underline, decorationColor: Colors.deepOrangeAccent),
                                                                              ),
                                                                            ]),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: h *
                                                                        0.07,
                                                                  ),
                                                                  SizedBox(
                                                                    height: h *
                                                                        0.06,
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              w * 0.02),
                                                                      child:
                                                                          ElevatedButton(
                                                                        onPressed:
                                                                            () {
                                                                          showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return StatefulBuilder(builder: (BuildContext context, StateSetter bottomState) {
                                                                                return Padding(
                                                                                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                                                                    child: Container(
                                                                                        height: h * 0.55,
                                                                                        width: double.infinity,
                                                                                        child: Padding(
                                                                                            padding: const EdgeInsets.symmetric(
                                                                                              horizontal: 18,
                                                                                            ),
                                                                                            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                                                                                              // Align(
                                                                                              //   alignment:
                                                                                              //       Alignment.topRight,
                                                                                              //   child: IconButton(
                                                                                              //       onPressed: () {},
                                                                                              //       icon: Icon(
                                                                                              //         Icons.clear,
                                                                                              //         size: 16,
                                                                                              //       )),
                                                                                              // ),

                                                                                              SizedBox(
                                                                                                height: h * 0.029,
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: Alignment.topRight,
                                                                                                child: InkWell(
                                                                                                  onTap: () {
                                                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DemtScreen()));
                                                                                                  },
                                                                                                  child: const Icon(
                                                                                                    Icons.clear,
                                                                                                    size: 17,
                                                                                                    color: Colors.black54,
                                                                                                  ),
                                                                                                ),
                                                                                              ),

                                                                                              const Center(
                                                                                                child: Text(
                                                                                                  "Verification",
                                                                                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xff595A76)),
                                                                                                ),
                                                                                              ),
                                                                                              const Divider(),
                                                                                              const Center(
                                                                                                child: Text(
                                                                                                  "Plese enter The OTP Sent To the registerd mobile number",
                                                                                                  style: TextStyle(fontSize: 10, color: Colors.black38),
                                                                                                ),
                                                                                              ),
                                                                                              const Center(
                                                                                                child: Text(
                                                                                                  "88***88",
                                                                                                  style: TextStyle(fontSize: 13, color: Color.fromARGB(255, 109, 107, 107)),
                                                                                                ),
                                                                                              ),

                                                                                              SizedBox(
                                                                                                height: 58,
                                                                                                child: Center(
                                                                                                  child: ListView.builder(
                                                                                                      shrinkWrap: true,
                                                                                                      itemCount: 4,
                                                                                                      scrollDirection: Axis.horizontal,
                                                                                                      itemBuilder: (BuildContext context, index) {
                                                                                                        return SizedBox(
                                                                                                          height: 68,
                                                                                                          width: 55,
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsets.only(left: w * 0.02, top: h * 0.02),
                                                                                                            child: Theme(
                                                                                                              data: ThemeData(
                                                                                                                primaryColor: const Color.fromARGB(255, 211, 185, 183),
                                                                                                                primaryColorDark: const Color.fromARGB(255, 230, 195, 195),
                                                                                                              ),
                                                                                                              child: Center(
                                                                                                                child: (TextFormField(
                                                                                                                  maxLength: 1,
                                                                                                                  textAlign: TextAlign.center,
                                                                                                                  keyboardType: TextInputType.number,
                                                                                                                  cursorColor: Theme.of(context).primaryColor,
                                                                                                                  decoration: InputDecoration(
                                                                                                                      contentPadding: const EdgeInsets.all(0),
                                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                                          borderRadius: BorderRadius.circular(11),
                                                                                                                          borderSide: const BorderSide(
                                                                                                                            color: Color.fromARGB(255, 213, 195, 195),
                                                                                                                          )),
                                                                                                                      filled: true,
                                                                                                                      fillColor: AppColors.whiteColor,
                                                                                                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
                                                                                                                      counterText: '',
                                                                                                                      hintStyle: const TextStyle(
                                                                                                                        color: Colors.black,
                                                                                                                        fontSize: 20.0,
                                                                                                                      )),
                                                                                                                  onChanged: (value) {
                                                                                                                    if (value.length == 1) {
                                                                                                                      FocusScope.of(context).nextFocus();
                                                                                                                    }
                                                                                                                  },
                                                                                                                )),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }),
                                                                                                ),
                                                                                              ),

                                                                                              SizedBox(
                                                                                                height: h * 0.028,
                                                                                              ),
                                                                                              Container(
                                                                                                height: h * 0.15,
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                                    color: const Color.fromARGB(255, 248, 234, 228),
                                                                                                    border: Border.all(
                                                                                                      color: const Color(0xffE4D8CC),
                                                                                                    )),
                                                                                                child: Column(
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                                                                                                      child: const Row(
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            "havent recived OTP? Wait For SomTime to \n                   get'Resend OTP,",
                                                                                                            style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 30, 30, 30)),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    const Center(
                                                                                                      child: Text(
                                                                                                        "Dont Want to Wait for OTP SMS?\n Try i-Safe and generated OTP your Own.",
                                                                                                        style: TextStyle(
                                                                                                          fontSize: 11,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    const Row(
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          "Click here",
                                                                                                          style: TextStyle(
                                                                                                            decoration: TextDecoration.underline,
                                                                                                            fontSize: 11,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          " to know more.",
                                                                                                          style: TextStyle(
                                                                                                            fontSize: 11,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    )
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              SizedBox(
                                                                                                height: h * 0.05,
                                                                                              ),
                                                                                              SizedBox(
                                                                                                height: h * 0.062,
                                                                                                width: double.infinity,
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                                                                                                  child: ElevatedButton(
                                                                                                    onPressed: () {
                                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DemtTransaction()));
                                                                                                    },
                                                                                                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 65, 75, 155).withOpacity(1.0) // Backg/ Background color
                                                                                                        // Backg // Background color
                                                                                                        ),
                                                                                                    child: const Center(
                                                                                                      child: Text(
                                                                                                        'SUBMIT OTP',
                                                                                                        style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 239, 230, 230)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ]))));
                                                                              });
                                                                            },
                                                                          );
                                                                        },
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          backgroundColor: const Color.fromARGB(255, 65, 75, 155).withOpacity(1.0), // Backg/ Background color
                                                                          // Background color
                                                                        ),
                                                                        child:
                                                                            const Center(
                                                                          child:
                                                                              Text(
                                                                            'Proceed TO Conform',
                                                                            style:
                                                                                TextStyle(fontSize: 16, color: Color.fromARGB(255, 243, 233, 233)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ])))));
                                          });
                                        },
                                      );
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Select Another mode ",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromARGB(
                                                  255, 211, 130, 124),
                                              fontStyle: FontStyle.italic),
                                        ),
                                        Icon(
                                          Icons
                                              .keyboard_double_arrow_right_outlined,
                                          size: 14,
                                          color: Colors.deepOrange,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Color.fromARGB(255, 211, 189, 189),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .start, // Aligns children horizontally to the start
                                crossAxisAlignment: CrossAxisAlignment
                                    .center, // Aligns children vertically to the start
                                children: [
                                  CircleAvatar(
                                    backgroundColor: const Color(0xffDBCBB1)
                                        .withOpacity(0.6),
                                    maxRadius: 15,
                                    child: Center(
                                      child: Image.asset(
                                        "assets/images/Check debit.png",
                                        height: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.03,
                                  ),
                                  const Text(
                                    "IMPS",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const Spacer(), // Takes remaining space
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                      activeColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      value: check1,
                                      onChanged: (val) {
                                        setState(() {
                                          check1 = val!;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Padding(
                            // padding:
                            //       EdgeInsets.symmetric(horizontal: w * 0.02),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       CircleAvatar(
                            //         backgroundColor: const Color(0xffDBCBB1)
                            //             .withOpacity(0.6),
                            //         maxRadius: 15,
                            //         child: Center(
                            //           child: Image.asset(
                            //             "assets/images/Check debit.png",
                            //             height: 20,
                            //           ),
                            //         ),
                            //       ),
                            //       SizedBox(
                            //         width: w * 0.03,
                            //       ),
                            //       const Text(
                            //         "IMPS",
                            //         style: TextStyle(
                            //             fontSize: 16, color: Colors.black54),
                            //       ),
                            //       const Spacer(),
                            //       Transform.scale(
                            //         scale: 1.3,
                            //         child: Checkbox(
                            //             activeColor: Colors.green,
                            //             shape: RoundedRectangleBorder(
                            //                 borderRadius:
                            //                     BorderRadius.circular(10)),
                            //             value: check1,
                            //             onChanged: (val) {
                            //               setState(() {
                            //                 check1 = val!;
                            //               });
                            //             }),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.0800,
                      ),
                      // SizedBox(
                      //   height: h * 0.06,
                      //   width: double.infinity,
                      //   child: Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                      //     child: ElevatedButton(
                      //       onPressed: () {
                      //         // showModalBottomSheet(
                      //         //   isScrollControlled: true,
                      //         //   context: context,
                      //         //   builder: (context) {
                      //         //     return StatefulBuilder(builder:
                      //         //         (BuildContext context,
                      //         //             StateSetter bottomState) {
                      //         //       return Padding(
                      //         //           padding: EdgeInsets.only(
                      //         //               bottom: MediaQuery.of(context)
                      //         //                   .viewInsets
                      //         //                   .bottom),
                      //         //           child: Container(
                      //         //               height: h * 0.55,
                      //         //               width: double.infinity,
                      //         //               child: Padding(
                      //         //                   padding:
                      //         //                       const EdgeInsets.symmetric(
                      //         //                     horizontal: 18,
                      //         //                   ),
                      //         //                   child: Column(
                      //         //                       mainAxisAlignment:
                      //         //                           MainAxisAlignment.start,
                      //         //                       crossAxisAlignment:
                      //         //                           CrossAxisAlignment
                      //         //                               .start,
                      //         //                       children: <Widget>[
                      //         //                         // Align(
                      //         //                         //   alignment:
                      //         //                         //       Alignment.topRight,
                      //         //                         //   child: IconButton(
                      //         //                         //       onPressed: () {},
                      //         //                         //       icon: Icon(
                      //         //                         //         Icons.clear,
                      //         //                         //         size: 16,
                      //         //                         //       )),
                      //         //                         // ),

                      //         //                         SizedBox(
                      //         //                           height: h * 0.029,
                      //         //                         ),
                      //         //                         Align(
                      //         //                           alignment:
                      //         //                               Alignment.topRight,
                      //         //                           child: InkWell(
                      //         //                             onTap: () {
                      //         //                               Navigator.push(
                      //         //                                   context,
                      //         //                                   MaterialPageRoute(
                      //         //                                       builder:
                      //         //                                           (context) =>
                      //         //                                               const DemtScreen()));
                      //         //                             },
                      //         //                             child: const Icon(
                      //         //                               Icons.clear,
                      //         //                               size: 17,
                      //         //                               color:
                      //         //                                   Colors.black54,
                      //         //                             ),
                      //         //                           ),
                      //         //                         ),

                      //         //                         const Center(
                      //         //                           child: Text(
                      //         //                             "Verification",
                      //         //                             style: TextStyle(
                      //         //                                 fontWeight:
                      //         //                                     FontWeight
                      //         //                                         .w600,
                      //         //                                 fontSize: 18,
                      //         //                                 color: Color(
                      //         //                                     0xff595A76)),
                      //         //                           ),
                      //         //                         ),
                      //         //                         const Divider(),
                      //         //                         const Center(
                      //         //                           child: Text(
                      //         //                             "Plese enter The OTP Sent To the registerd mobile number",
                      //         //                             style: TextStyle(
                      //         //                                 fontSize: 10,
                      //         //                                 color: Colors
                      //         //                                     .black38),
                      //         //                           ),
                      //         //                         ),
                      //         //                         const Center(
                      //         //                           child: Text(
                      //         //                             "88***88",
                      //         //                             style: TextStyle(
                      //         //                                 fontSize: 13,
                      //         //                                 color: Color
                      //         //                                     .fromARGB(
                      //         //                                         255,
                      //         //                                         109,
                      //         //                                         107,
                      //         //                                         107)),
                      //         //                           ),
                      //         //                         ),

                      //         //                         SizedBox(
                      //         //                           height: 58,
                      //         //                           child: Center(
                      //         //                             child:
                      //         //                                 ListView.builder(
                      //         //                                     shrinkWrap:
                      //         //                                         true,
                      //         //                                     itemCount: 4,
                      //         //                                     scrollDirection:
                      //         //                                         Axis
                      //         //                                             .horizontal,
                      //         //                                     itemBuilder:
                      //         //                                         (BuildContext
                      //         //                                                 context,
                      //         //                                             index) {
                      //         //                                       return SizedBox(
                      //         //                                         height:
                      //         //                                             68,
                      //         //                                         width: 55,
                      //         //                                         child:
                      //         //                                             Padding(
                      //         //                                           padding: EdgeInsets.only(
                      //         //                                               left: w *
                      //         //                                                   0.02,
                      //         //                                               top:
                      //         //                                                   h * 0.02),
                      //         //                                           child:
                      //         //                                               Theme(
                      //         //                                             data:
                      //         //                                                 ThemeData(
                      //         //                                               primaryColor: const Color.fromARGB(
                      //         //                                                   255,
                      //         //                                                   211,
                      //         //                                                   185,
                      //         //                                                   183),
                      //         //                                               primaryColorDark: const Color.fromARGB(
                      //         //                                                   255,
                      //         //                                                   230,
                      //         //                                                   195,
                      //         //                                                   195),
                      //         //                                             ),
                      //         //                                             child:
                      //         //                                                 Center(
                      //         //                                               child:
                      //         //                                                   (TextFormField(
                      //         //                                                 maxLength: 1,
                      //         //                                                 textAlign: TextAlign.center,
                      //         //                                                 keyboardType: TextInputType.number,
                      //         //                                                 cursorColor: Theme.of(context).primaryColor,
                      //         //                                                 decoration: InputDecoration(
                      //         //                                                     contentPadding: const EdgeInsets.all(0),
                      //         //                                                     enabledBorder: OutlineInputBorder(
                      //         //                                                         borderRadius: BorderRadius.circular(11),
                      //         //                                                         borderSide: const BorderSide(
                      //         //                                                           color: Color.fromARGB(255, 213, 195, 195),
                      //         //                                                         )),
                      //         //                                                     filled: true,
                      //         //                                                     fillColor: Colors.white,
                      //         //                                                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
                      //         //                                                     counterText: '',
                      //         //                                                     hintStyle: const TextStyle(
                      //         //                                                       color: Colors.black,
                      //         //                                                       fontSize: 20.0,
                      //         //                                                     )),
                      //         //                                                 onChanged: (value) {
                      //         //                                                   if (value.length == 1) {
                      //         //                                                     FocusScope.of(context).nextFocus();
                      //         //                                                   }
                      //         //                                                 },
                      //         //                                               )),
                      //         //                                             ),
                      //         //                                           ),
                      //         //                                         ),
                      //         //                                       );
                      //         //                                     }),
                      //         //                           ),
                      //         //                         ),

                      //         //                         SizedBox(
                      //         //                           height: h * 0.028,
                      //         //                         ),
                      //         //                         Container(
                      //         //                           height: h * 0.15,
                      //         //                           width: double.infinity,
                      //         //                           decoration:
                      //         //                               BoxDecoration(
                      //         //                                   borderRadius:
                      //         //                                       BorderRadius
                      //         //                                           .circular(
                      //         //                                               8),
                      //         //                                   color: const Color
                      //         //                                       .fromARGB(
                      //         //                                       255,
                      //         //                                       248,
                      //         //                                       234,
                      //         //                                       228),
                      //         //                                   border:
                      //         //                                       Border.all(
                      //         //                                     color: const Color(
                      //         //                                         0xffE4D8CC),
                      //         //                                   )),
                      //         //                           child: Column(
                      //         //                             mainAxisAlignment:
                      //         //                                 MainAxisAlignment
                      //         //                                     .center,
                      //         //                             crossAxisAlignment:
                      //         //                                 CrossAxisAlignment
                      //         //                                     .center,
                      //         //                             children: [
                      //         //                               Padding(
                      //         //                                 padding: EdgeInsets
                      //         //                                     .symmetric(
                      //         //                                         horizontal:
                      //         //                                             w * 0.03),
                      //         //                                 child: const Row(
                      //         //                                   mainAxisAlignment:
                      //         //                                       MainAxisAlignment
                      //         //                                           .center,
                      //         //                                   crossAxisAlignment:
                      //         //                                       CrossAxisAlignment
                      //         //                                           .center,
                      //         //                                   children: [
                      //         //                                     Text(
                      //         //                                       "havent recived OTP? Wait For SomTime to \n                   get'Resend OTP,",
                      //         //                                       style: TextStyle(
                      //         //                                           fontSize:
                      //         //                                               12,
                      //         //                                           color: Color.fromARGB(
                      //         //                                               255,
                      //         //                                               30,
                      //         //                                               30,
                      //         //                                               30)),
                      //         //                                     ),
                      //         //                                   ],
                      //         //                                 ),
                      //         //                               ),
                      //         //                               const Center(
                      //         //                                 child: Text(
                      //         //                                   "Dont Want to Wait for OTP SMS?\n Try i-Safe and generated OTP your Own.",
                      //         //                                   style:
                      //         //                                       TextStyle(
                      //         //                                     fontSize: 11,
                      //         //                                   ),
                      //         //                                 ),
                      //         //                               ),
                      //         //                               const Row(
                      //         //                                 mainAxisAlignment:
                      //         //                                     MainAxisAlignment
                      //         //                                         .center,
                      //         //                                 children: [
                      //         //                                   Text(
                      //         //                                     "Click here",
                      //         //                                     style:
                      //         //                                         TextStyle(
                      //         //                                       decoration:
                      //         //                                           TextDecoration
                      //         //                                               .underline,
                      //         //                                       fontSize:
                      //         //                                           11,
                      //         //                                     ),
                      //         //                                   ),
                      //         //                                   Text(
                      //         //                                     " to know more.",
                      //         //                                     style:
                      //         //                                         TextStyle(
                      //         //                                       fontSize:
                      //         //                                           11,
                      //         //                                     ),
                      //         //                                   ),
                      //         //                                 ],
                      //         //                               )
                      //         //                             ],
                      //         //                           ),
                      //         //                         ),
                      //         //                         SizedBox(
                      //         //                           height: h * 0.05,
                      //         //                         ),
                      //         //                         SizedBox(
                      //         //                           height: h * 0.062,
                      //         //                           width: double.infinity,
                      //         //                           child: Padding(
                      //         //                             padding: EdgeInsets
                      //         //                                 .symmetric(
                      //         //                                     horizontal:
                      //         //                                         w * 0.02),
                      //         //                             child: ElevatedButton(
                      //         //                               onPressed: () {
                      //         //                                 Navigator.push(
                      //         //                                     context,
                      //         //                                     MaterialPageRoute(
                      //         //                                         builder:
                      //         //                                             (context) =>
                      //         //                                                 const DemtTransaction()));
                      //         //                               },
                      //         //                               style:
                      //         //                                   ElevatedButton
                      //         //                                       .styleFrom(
                      //         //                                 primary: const Color
                      //         //                                         .fromARGB(
                      //         //                                         255,
                      //         //                                         65,
                      //         //                                         75,
                      //         //                                         155)
                      //         //                                     .withOpacity(
                      //         //                                         1.0), // Backg/ Background color
                      //         //                               ),
                      //         //                               child: const Center(
                      //         //                                 child: Text(
                      //         //                                   'SUBMIT OTP',
                      //         //                                   style: TextStyle(
                      //         //                                       fontSize:
                      //         //                                           16,
                      //         //                                       color: Color
                      //         //                                           .fromARGB(
                      //         //                                               255,
                      //         //                                               239,
                      //         //                                               230,
                      //         //                                               230)),
                      //         //                                 ),
                      //         //                               ),
                      //         //                             ),
                      //         //                           ),
                      //         //                         ),
                      //         //                       ]))));
                      //         //     });
                      //         //   },
                      //         // );
                      //       },
                      //       style: ElevatedButton.styleFrom(
                      //           primary: const Color(
                      //               0xff6485B0) // Backg// Background color
                      //           ),
                      //       child: const Center(
                      //         child: Text(
                      //           'Proceed TO Conform',
                      //           style: TextStyle(
                      //               fontSize: 16, color: Colors.white),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ]),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom)),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.032,
          ),
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter bottomState) {
                    return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                            height: h * 0.55,
                            width: double.infinity,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // Align(
                                      //   alignment:
                                      //       Alignment.topRight,
                                      //   child: IconButton(
                                      //       onPressed: () {},
                                      //       icon: Icon(
                                      //         Icons.clear,
                                      //         size: 16,
                                      //       )),
                                      // ),

                                      SizedBox(
                                        height: h * 0.029,
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const DemtScreen()));
                                          },
                                          child: const Icon(
                                            Icons.clear,
                                            size: 17,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),

                                      const Center(
                                        child: Text(
                                          "Verification",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: Color(0xff595A76)),
                                        ),
                                      ),
                                      const Divider(),
                                      const Center(
                                        child: Text(
                                          "Plese enter The OTP Sent To the registerd mobile number",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black38),
                                        ),
                                      ),
                                      const Center(
                                        child: Text(
                                          "88***88",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Color.fromARGB(
                                                  255, 109, 107, 107)),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 58,
                                        child: Center(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: 4,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      index) {
                                                return SizedBox(
                                                  height: 68,
                                                  width: 55,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: w * 0.02,
                                                        top: h * 0.02),
                                                    child: Theme(
                                                      data: ThemeData(
                                                        primaryColor:
                                                            const Color
                                                                .fromARGB(255,
                                                                211, 185, 183),
                                                        primaryColorDark:
                                                            const Color
                                                                .fromARGB(255,
                                                                230, 195, 195),
                                                      ),
                                                      child: Center(
                                                        child: (TextFormField(
                                                          maxLength: 1,
                                                          textAlign:
                                                              TextAlign.center,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          cursorColor:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          decoration:
                                                              InputDecoration(
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          0),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(
                                                                              11),
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                213,
                                                                                195,
                                                                                195),
                                                                          )),
                                                                  filled: true,
                                                                  fillColor:
                                                                     AppColors
                                                                          .whiteColor,
                                                                         
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              11)),
                                                                  counterText:
                                                                      '',
                                                                  hintStyle:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        20.0,
                                                                  )),
                                                          onChanged: (value) {
                                                            if (value.length ==
                                                                1) {
                                                              FocusScope.of(
                                                                      context)
                                                                  .nextFocus();
                                                            }
                                                          },
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),

                                      SizedBox(
                                        height: h * 0.028,
                                      ),
                                      Container(
                                        height: h * 0.15,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: const Color.fromARGB(
                                                255, 248, 234, 228),
                                            border: Border.all(
                                              color: const Color(0xffE4D8CC),
                                            )),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: w * 0.03),
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "havent recived OTP? Wait For SomTime to \n                   get'Resend OTP,",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Color.fromARGB(
                                                            255, 30, 30, 30)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Center(
                                              child: Text(
                                                "Dont Want to Wait for OTP SMS?\n Try i-Safe and generated OTP your Own.",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ),
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Click here",
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 11,
                                                  ),
                                                ),
                                                Text(
                                                  " to know more.",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: h * 0.05,
                                      ),
                                      SizedBox(
                                        height: h * 0.062,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: w * 0.02),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const DemtTransaction()));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color.fromARGB(
                                                      255, 65, 75, 155)
                                                  .withOpacity(
                                                      1.0), // Backg/ Background color
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'SUBMIT OTP',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 239, 230, 230)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]))));
                  });
                },
              );
            },
            child: Text('Proceed TO Conform',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteColor,
                )),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 52, 79, 128),
              // Backg// Background color

              // Check for correct variable name
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
              ),
              minimumSize: Size(double.infinity, 38), // Set the button size
            ),
          ),
        ));
  }
}
