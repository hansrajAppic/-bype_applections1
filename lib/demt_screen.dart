
// ignore_for_file: prefer_const_constructors

import 'Globale_class/colors.dart';
import 'demt_fundtransfer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: depend_on_referenced_packages

class DemtScreen extends StatefulWidget {
  const DemtScreen({super.key});

  @override
  State<DemtScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DemtScreen> {
  int selectedContainerIndex = 0;
  Color selectedColor = const Color.fromARGB(255, 227, 117, 43);
  Color unselectedColor = AppColors.whiteColor;
  String currentDate = DateFormat('0dd-MM-yyyy').format(DateTime.now());
  String todayDate = DateFormat('yMd').format(DateTime.now());
  List<String> containerItems = [
    'own Account',
    'Within ICICI',
    'OutSide ICICI',
  ];
  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();

  final List<Map<String, dynamic>> _allUsers = [
    {"image": "assets/images/Bdoda.png", "name": "Andy", "age": 29},
    {
      "image": "assets/images/bhank-removebg-preview.png",
      "name": "Aragon",
      "age": 40
    },
    {
      "image": "assets/images/Bdoda.png",
      "name": "hansraj",
      "age": "XXXXXXXXXX7978"
    },
    {
      "image": "assets/images/Bdoda.png",
      "name": "rrechrecharge",
      "age": "XXXXXXX3507"
    },
    {
      "image": "assets/images/bhank-removebg-preview.png",
      "name": "idsyesbank",
      "age": "XXXXXXXXXXX0321"
    },
    {
      "image": "assets/images/bhank-removebg-preview.png",
      "name": "bobmbika",
      "age": "XXXXXXXXXX0003"
    },
    {
      "image": "assets/images/bhank-removebg-preview.png",
      "name": "Audra",
      "age": 30
    },
    {"image": "assets/images/Bdoda.png", "name": "Banana", "age": 14},
    {
      "image": "assets/images/bhank-removebg-preview.png",
      "name": "Caversky",
      "age": 100
    },
    {
      "image": "assets/images/bhank-removebg-preview.png",
      "name": "Becky",
      "age": 32
    },
  ];

  List<Map<String, dynamic>> _foundUsers = [];
  // ignore: non_constant_identifier_names
  TextEditingController SearchPayeeController = TextEditingController();
  @override
  initState() {
    // at the beginning, all users are shown
    // _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          actions: [
            Icon(
              Icons.help_outline,
              color: AppColors.whiteColor,
            ),
            SizedBox(
              width: w * 0.02,
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                    Color.fromARGB(255, 197, 76, 39),
                    Colors.red,
                    Colors.deepOrange,
                    Color(0xffF76200),

                    Color(0xffED8216),
                    // Color(0xffEE882B),
                    // Color.fromARGB(255, 205, 102, 19),
                  ]),
            ),
          ),
          leading: const Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
          ),
          title: const Text(
            "Fund Transfer",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color:AppColors.whiteColor,
            ),
          ),
          centerTitle: true,
          toolbarHeight: 45,
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.03),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: h * 0.016,
                      ),
                      Stack(children: [
                        Container(
                          height: h * 0.058,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              // color: const Color.fromARGB(255, 215, 236, 247),
                              color: const Color(0xffE3F2FD),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 223, 217, 217)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(69, 143, 145, 135),
                                  blurRadius: 4,
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: w * 0.46,
                              ),
                              Image.asset(
                                "assets/images/upi_2-removebg-preview.png",
                                height: 18,
                              ),
                              const Text(
                                "Upi Payments",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 158, 156, 156)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: h * 0.058,
                          width: w * 0.49,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              // color: const Color.fromARGB(255, 72, 119, 194),
                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xff375998),
                                  // Color(0xff4374AC),

                                  Color(0xff386BBB)
                                ],
                              ),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 223, 217, 217)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(69, 143, 145, 135),
                                  blurRadius: 4,
                                ),
                              ]),
                          child: const Center(
                            child: Text(
                              "Bank Transfer ",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),

                          // color: const Color.fromARGB(255, 77, 64, 255),
                        )
                      ]),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      const Text(
                        "Tarnsfer FundsTo",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 78, 78, 78)),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      SizedBox(
                        height: h * 0.05,
                        child: ListView.builder(
                            itemCount: containerItems.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, index) {
                              return (InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedContainerIndex = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.01),
                                    child: Container(
                                        width: w * 0.29,

                                        // color: selectedContainerIndex ==
                                        //         index
                                        //     ? selectedColor
                                        //     : unselectedColor,
                                        // padding: EdgeInsets.all(16.0),
                                        decoration: BoxDecoration(

                                            // color: Colors.white,
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 232, 226, 226)),
                                            color:
                                                selectedContainerIndex == index
                                                    ? selectedColor
                                                    : unselectedColor,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Center(
                                          child: Text(
                                            containerItems[index],
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 107, 107, 107),
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        )),
                                  )));
                            }),
                      ),
                      SizedBox(
                        height: h * 0.022,
                      ),
                      const Text(
                        "Selact Payee",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(221, 22, 22, 22)),
                      ),
                      SizedBox(
                        height: h * 0.005,
                      ),
                      TextFormField(
                        controller: SearchPayeeController,
                        onChanged: (value) => _runFilter(value),
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 10, 10, 15),
                          prefixIcon: const Icon(Icons.search,
                              color: Color.fromARGB(255, 142, 137, 137)),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 30, top: h * 0.012),
                            child: Stack(children: [
                              SizedBox(
                                height: h * 0.04,
                                child: const VerticalDivider(
                                  color: Colors.black12,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: w * 0.038, top: h * 0.004),
                                child: const Icon(Icons.person_add_alt,
                                    color: Color.fromARGB(255, 211, 130, 124)
                                    // .withOpacity(1.0),
                                    ),
                              ),
                            ]),
                          ),
                          // SizedBox(
                          //   width: w * 0.05,
                          // ),

                          hintText: "Search Payee",
                          hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 142, 137, 137)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 204, 196, 196)),
                              borderRadius: BorderRadius.circular(22)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 142, 137, 137)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter check password';
                          }
                          return null;
                        },
                      ),
                      _foundUsers.isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.only(top: h * 0.018),
                              child: Container(
                                height: 1999,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xffFFFFFF),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(69, 143, 145, 135),
                                        blurRadius: 4,
                                      ),
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: h * 0.02,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: w * 0.04),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Search Results",
                                            style: TextStyle(fontSize: 13),
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
                                        ],
                                      ),
                                    ),
                                    ListView.builder(
                                      controller: ScrollController(),
                                      shrinkWrap: true,
                                      itemCount: _foundUsers.length,
                                      itemBuilder: (context, index) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: w * 0.03),
                                        child: Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const DemtFundTransfer()));
                                              },
                                              child: ListTile(
                                                //   leading: const Icon(
                                                //     Icons.account_balance,
                                                //     color: Colors.deepOrange,
                                                //  ),

                                                leading: Image.asset(
                                                  _foundUsers[index]['image'],
                                                  height: 22,
                                                ),

                                                title: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: h * 0.02),
                                                  child: Text(
                                                    _foundUsers[index]['name'],
                                                    style: const TextStyle(
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  '${_foundUsers[index]["age"].toString()},',
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color.fromARGB(
                                                        255,
                                                        177,
                                                        174,
                                                        174,
                                                      )),
                                                ),
                                              ),
                                            ),
                                            const Divider(),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.03,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: h * 0.06,
                                          width: w * 0.42,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                              // color: const Color(0xffFFFFFF),
                                              color: const Color.fromARGB(
                                                  255, 86, 68, 189),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      69, 143, 145, 135),
                                                  blurRadius: 4,
                                                ),
                                              ]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const CircleAvatar(
                                                maxRadius: 10,
                                                backgroundColor:AppColors.whiteColor,
                                                child: Icon(
                                                  Icons.add,
                                                  size: 14,
                                                ),
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              const Text(
                                                "Add New Payee",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xffFFFFFF),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: h * 0.06,
                                          width: w * 0.42,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                              color: const Color.fromARGB(
                                                  255, 86, 68, 189),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      69, 143, 145, 135),
                                                  blurRadius: 4,
                                                ),
                                              ]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const CircleAvatar(
                                                maxRadius: 10,
                                                backgroundColor: AppColors.whiteColor,
                                                child: Icon(
                                                  Icons.download,
                                                  size: 14,
                                                ),
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              const Text(
                                                "Try UPI",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xffFFFFFF),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : SizedBox(
                              height: h * 0.1,
                            ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: h * 0.43,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(19),
                      topRight: Radius.circular(19)),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                      color: const Color.fromARGB(255, 223, 217, 217)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(69, 143, 145, 135),
                      blurRadius: 4,
                    ),
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * 0.03,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: h * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.access_alarm_sharp,
                          size: 18,
                        ),
                        SizedBox(
                          width: w * 0.02,
                        ),
                        const Text(
                          "Recent Tarnsfers",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff111111)),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_arrow_up,
                          size: 25,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: h * 0.045,
                            child: const Icon(Icons.account_balance,
                                size: 23,
                                color: Color.fromARGB(255, 231, 105, 96)
                                // .withOpacity(1.0),
                                ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "exchange",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                                Text(
                                  "81180055755599",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black38),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: w * 0.18,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "₹100000",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              // Text(
                              //   "03-11-2023",
                              //   style: TextStyle(
                              //       fontSize: 10,
                              //       fontWeight: FontWeight.w400,
                              //       color: Colors.black38),
                              // ),

                              Text(
                                currentDate,
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black38),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: w * 0.039,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DemtFundTransfer()));
                            },
                            child: Container(
                              height: h * 0.0310,
                              width: w * 0.14,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: const Color(0xff4374AC)),
                              child: const Center(
                                child: Text(
                                  'Pay',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color:
                                          Color.fromARGB(255, 234, 231, 231)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: w * 0.0058,
                          ),
                          SizedBox(
                            height: h * 0.03,
                          ),
                        ]),
                    Divider(
                      height: h * 0.033,
                      color: Colors.black12,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(
                      height: h * 0.019,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: h * 0.045,
                          //   child: const Icon(
                          //     Icons.account_balance,
                          //     color: Colors.red,
                          //     size: 23,
                          //   ),
                          // ),
                          Image.asset(
                            "assets/images/axis bank.png",
                            height: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mobiwik",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                                Text(
                                  "81180055755599",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black38),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: w * 0.18,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "₹100000",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                currentDate,
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black38),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: w * 0.039,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DemtFundTransfer()));
                            },
                            child: Container(
                              height: h * 0.0310,
                              width: w * 0.14,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: const Color(0xff4374AC)),
                              child: const Center(
                                child: Text(
                                  'Pay',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color:
                                          Color.fromARGB(255, 234, 231, 231)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: w * 0.0058,
                          ),
                          SizedBox(
                            height: h * 0.03,
                          ),
                        ]),
                    Divider(
                      height: h * 0.033,
                      color: Colors.black12,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: h * 0.045,
                            child: const Icon(Icons.account_balance,
                                size: 23,
                                color: Color.fromARGB(255, 231, 105, 96)
                                // .withOpacity(1.0),
                                ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "exchange",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "81180055755599",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black38),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: w * 0.182,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "₹100000",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                currentDate,
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black38),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: w * 0.039,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DemtFundTransfer()));
                            },
                            child: Container(
                              height: h * 0.0310,
                              width: w * 0.14,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: const Color(0xff4374AC)),
                              child: const Center(
                                child: Text(
                                  'Pay',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color:
                                          Color.fromARGB(255, 234, 231, 231)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: w * 0.0058,
                          ),
                          SizedBox(
                            height: h * 0.03,
                          ),
                        ]),
                    Divider(
                      height: h * 0.033,
                      color: Colors.black12,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom)),
          ]),
        ));
  }
}
