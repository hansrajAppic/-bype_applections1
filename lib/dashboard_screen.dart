// ignore_for_file: file_names, unused_field, avoid_print, unused_local_variable, use_build_context_synchronously, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, camel_case_types, non_constant_identifier_names, unnecessary_new, unused_element, prefer_const_constructors, use_key_in_widget_constructors, avoid_init_to_null

import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:bype_applections1/news_screen.dart';
import 'package:bype_applections1/upitransfer_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'Globale_class/checknumberapi.dart';
import 'Globale_class/colors.dart';
import 'Globale_class/companyinformationdata.dart';
import 'Globale_class/drawer.dart';
import 'Json_model/baner_model.dart';
import 'Json_model/company_logain_details_model.dart';
import 'Json_model/getactiveaepsbank_model.dart';
import 'Widget_Class/costem_dailogbox.dart';
import 'Widget_Class/customelevatedButton.dart';
import 'bbps_screen.dart';
import 'dth_screen.dart';
import 'fund_trensfer_screen.dart';
import 'globale_class.dart';
import 'search_contactslist_screen.dart';
import 'search_paytm.dart';

const double _kSize = 70.0;

class DashBord_Screen extends StatefulWidget {
  @override
  State<DashBord_Screen> createState() => _DashBord_ScreenState();
}

class _DashBord_ScreenState extends State<DashBord_Screen> {
  bool isLoading = true;
  ScrollController ctrl1 = ScrollController();
  ScrollController ctrl2 = ScrollController();
  final ScrollController _scrollController = ScrollController();
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  bool isCtrl1Scroll = true;

  // ignore: prefer_typing_uninitialized_variables
  var sp;

  Global globalInstance = Global();
  //  Future<String?> deviceIDs = MyGlobalFunctions.getId();
  List<BannerListData> banners = [];

  // ignore: duplicate_ignore
  // ignore: avoid_init_to_null
  CompanyData? companyData = null;
  // LoginData? getCustomerDat = null;
  APIManager apiManager = APIManager(); // Create an instance of APIManager

  getData? selectedBank;

  @override
  void initState() {
    ctrl1.addListener(_ctrl1Listner);
    ctrl2.addListener(_ctrl2Listner);

    super.initState();

    _futureCompanyData = _assignCustomerData();
    apiManager.getactiveaepsbankapi(context, setState);
    apiManager.getservicelistapi(context, setState);
  }

  late Future<CompanyData?> _futureCompanyData;

  // Add this line to keep track of the current index

  Future<CompanyData?> _assignCustomerData() async {
    return await globalInstance.getCompanyData();
  }

  void startAutoScroll() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_scrollController.hasClients) {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final currentScrollPosition = _scrollController.position.pixels;
        if (currentScrollPosition >= maxScrollExtent) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.animateTo(
            currentScrollPosition + 100.0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  double? _imageWidth;
  double? _imageHeight;
  @override
  void dispose() {
    ctrl1.removeListener(_ctrl1Listner);
    ctrl2.removeListener(_ctrl2Listner);
    ctrl1.dispose();
    ctrl2.dispose();
    super.dispose();
    _scrollController.dispose();
  }

  void _ctrl1Listner() {
    if (ctrl1.position.atEdge) {
      bool isTop = ctrl1.position.pixels == 0;
      if (isTop) {
        print('page_At the top');
      } else {
        setState(() {
          isCtrl1Scroll = false;
        });
        print('page_At the bottom');
      }
    }
  }

  void _ctrl2Listner() {
    if (ctrl2.position.atEdge) {
      bool isTop = ctrl2.position.pixels == 0;
      if (isTop) {
        setState(() {
          isCtrl1Scroll = true;
        });
        print('page_At the top::::::::::::ctrl2');
      } else {
        print('page_At the bottom:::::::::::ctrl2');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // Profile_succfuly items = widget.data;

    return Scaffold(
        backgroundColor: const Color(0xff022A72),
        drawer: CustomDrawer(),
        appBar: AppBar(
          backgroundColor: const Color(0xff022A72),
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  child: Icon(
                    Icons.person_2,
                    color: Color.fromARGB(255, 158, 183, 204),
                  ),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: FutureBuilder<CompanyData?>(
            future: _futureCompanyData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final logoUrl = snapshot.data!.data![0].logo;
                return ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  child: Image.network(
                    "https://sonitechno.info/images/Company/$logoUrl",
                    height: 200,
                    width: 170,
                  ),
                );
              }
            },
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // news
                      builder: (context) => NewsScreenss(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.messenger_outline,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                // Handle the onTap action for the messenger icon
              },
              child: const Icon(
                Icons.notification_add,
                color: AppColors.whiteColor,
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                physics: isCtrl1Scroll
                    ? const ClampingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                controller: ctrl1,
                child: Column(
                  children: [
                    const SizedBox(height: 180),
                    Container(
                      height: MediaQuery.of(context).size.longestSide - 100,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 242, 247, 251),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24))),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 5,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          SingleChildScrollView(
                            physics: isCtrl1Scroll
                                ? const NeverScrollableScrollPhysics()
                                : const ClampingScrollPhysics(),
                            controller: ctrl2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 18),

                                // FutureBuilder(
                                //   future: apiManager.getBanner(context,
                                //       setState), // Assuming you have a function named fetchBanners to fetch data
                                //   builder: (context,
                                //       AsyncSnapshot<dynamic> snapshot) {
                                //     if (!snapshot.hasData) {
                                //       return LoadingAnimationWidget.hexagonDots(
                                //         color: Colors.blue,
                                //         size: _kSize,
                                //       );
                                //     } else if (snapshot.hasError) {
                                //       return Center(child: Text("Loading..."));
                                //     } else {
                                //       return Column(
                                //         children: [
                                //           CarouselSlider.builder(
                                //             options: CarouselOptions(
                                //               enlargeCenterPage: false,
                                //               onPageChanged: (index, reason) {
                                //                 setState(() {
                                //                   currentIndex = index;
                                //                 });
                                //               },
                                //               viewportFraction: 1.0,
                                //               autoPlayInterval:
                                //                   const Duration(seconds: 3),
                                //               autoPlayAnimationDuration:
                                //                   const Duration(
                                //                       milliseconds: 800),
                                //               autoPlay: true,
                                //               autoPlayCurve:
                                //                   Curves.fastOutSlowIn,
                                //             ),
                                //             itemCount:
                                //                 snapshot.data?.data!.length,
                                //             itemBuilder:
                                //                 (context, index, realIndex) {
                                //               var makeFullUrl =
                                //                   "https://sonitechno.info/images/Banner/${snapshot.data?.data![index].imagePath}";

                                //               return SizedBox(
                                //                 child: Container(
                                //                   margin: EdgeInsets.symmetric(
                                //                       horizontal: w * 0.01),
                                //                   decoration: BoxDecoration(
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             6),
                                //                     color:
                                //                         const Color(0xffFFFFFF),
                                //                     border: Border.all(
                                //                       color:
                                //                           const Color.fromARGB(
                                //                               137,
                                //                               134,
                                //                               128,
                                //                               128),
                                //                     ),
                                //                     boxShadow: [
                                //                       const BoxShadow(
                                //                         color: Color.fromARGB(
                                //                             69, 143, 145, 135),
                                //                         blurRadius: 4,
                                //                       ),
                                //                     ],
                                //                   ),
                                //                   child: ClipRRect(
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             4),
                                //                     child: Image.network(
                                //                       makeFullUrl,
                                //                       width: double.infinity,
                                //                       height: 180,
                                //                     ),
                                //                   ),
                                //                 ),
                                //               );
                                //             },
                                //           ),
                                //           DotsIndicator(
                                //             dotsCount:
                                //                 snapshot.data?.data!.length,
                                //             position: currentIndex,
                                //             decorator: DotsDecorator(
                                //               color: Color.fromARGB(255, 234,
                                //                   72, 72), // Inactive dot color
                                //               activeColor: Colors
                                //                   .blue, // Active dot color
                                //               size: const Size.square(
                                //                   8.0), // Dot size
                                //               activeSize: const Size(
                                //                   20.0, 8.0), // Active dot size
                                //               spacing: const EdgeInsets.all(
                                //                   4.0), // Spacing between dots
                                //               activeShape:
                                //                   RoundedRectangleBorder(
                                //                 borderRadius: BorderRadius.circular(
                                //                     10.0), // Change the active dot shape
                                //               ),
                                //             ),
                                //           ),
                                //         ],
                                //       );
                                //     }
                                //   },
                                // ),
                                FutureBuilder<BannerHome?>(
                                  future:
                                      apiManager.getBanner(context, setState),
                                  builder: (context,
                                      AsyncSnapshot<BannerHome?> snapshot) {
                                    if (!snapshot.hasData) {
                                      return LoadingAnimationWidget.hexagonDots(
                                        color: Colors.blue,
                                        size: _kSize,
                                      );
                                    } else if (snapshot.hasError) {
                                      return Center(
                                          child: Text("Error loading data"));
                                    } else if (snapshot.data!.data == null ||
                                        snapshot.data!.data!.isEmpty) {
                                      return Center(
                                          child: Text("No banners available"));
                                    } else {
                                      return Column(
                                        children: [
                                          CarouselSlider.builder(
                                            options: CarouselOptions(
                                              enlargeCenterPage: false,
                                              onPageChanged: (index, reason) {
                                                setState(() {
                                                  currentIndex = index;
                                                });
                                              },
                                              viewportFraction: 1.0,
                                              autoPlayInterval:
                                                  const Duration(seconds: 3),
                                              autoPlayAnimationDuration:
                                                  const Duration(
                                                      milliseconds: 800),
                                              autoPlay: true,
                                              autoPlayCurve:
                                                  Curves.fastOutSlowIn,
                                            ),
                                            itemCount:
                                                snapshot.data!.data!.length,
                                            itemBuilder:
                                                (context, index, realIndex) {
                                              var banner =
                                                  snapshot.data!.data![index];
                                              var makeFullUrl =
                                                  "https://sonitechno.info/images/Banner/${banner.imagePath}";

                                              return SizedBox(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: w * 0.01),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    color:
                                                        const Color(0xffFFFFFF),
                                                    border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                              137,
                                                              134,
                                                              128,
                                                              128),
                                                    ),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                            69, 143, 145, 135),
                                                        blurRadius: 4,
                                                      ),
                                                    ],
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    child: Image.network(
                                                      makeFullUrl,
                                                      width: double.infinity,
                                                      height: 180,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          DotsIndicator(
                                            dotsCount:
                                                snapshot.data!.data!.length,
                                            position: currentIndex,
                                            decorator: DotsDecorator(
                                              color: const Color.fromARGB(
                                                  255,
                                                  234,
                                                  72,
                                                  72), // Inactive dot color
                                              activeColor: Colors
                                                  .blue, // Active dot color
                                              size: const Size.square(
                                                  8.0), // Dot size
                                              activeSize: const Size(
                                                  20.0, 8.0), // Active dot size
                                              spacing: const EdgeInsets.all(
                                                  4.0), // Spacing between dots
                                              activeShape:
                                                  RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    10.0), // Change the active dot shape
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                ),

                                buildListView(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void showDialoshowCustomDialog() {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return CustomDialog(
              title: CustomElevatedButton(
                minimumSize: Size(double.infinity, h * 0.03),
                color: Colors.red,
                onPressed: () {},
                child: Text(
                  'Select Bank',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              content: Container(
                child: Row(
                  children: [
                    for (var index = 0;
                        index < apiManager.getactiveaepsbankArry.length;
                        index++)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            String selectedBankName =
                                apiManager.getactiveaepsbankArry[index].name ??
                                    '';
                            selectedBank =
                                apiManager.getactiveaepsbankArry[index];

                            // apiManager.registrationApi(
                            //             context,
                            //             setState,
                            //             selectedBank?.name ?? '');

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ApesService_Screen(
                            //       selectedItem: apiManager
                            //               .getactiveaepsbankArry[index].name ??
                            //           '',
                            //       data: apiManager.getactiveaepsbankArry[index],
                            //     ),
                            //   ),
                            // );
                          });
                        },
                        // onTap: () {
                        //   setState(() {
                        //     selectedBank =
                        //     apiManager.getactiveaepsbankArry[index];
                        //     // Pass the selected bank name to the API
                        //     apiManager.registrationApi(
                        //         context,
                        //         setState,
                        //         selectedBank?.name ?? ''); // Providing default value if selectedBank.name is null
                        //   });
                        // },
                        child: Row(
                          children: [
                            Radio<getData>(
                              value: apiManager.getactiveaepsbankArry[index],
                              groupValue: selectedBank,
                              onChanged: (getData? value) {
                                setState(() {
                                  selectedBank = value;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apiManager
                                          .getactiveaepsbankArry[index].name ??
                                      '',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  apiManager.getactiveaepsbankArry[index]
                                          .status ??
                                      '',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildListView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildContainer(),
        ],
      ),
    );
  }

  Widget buildContainer() {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildListViewBuilder(),
      ],
    );
  }

  Widget buildListViewBuilder() {
    double h = MediaQuery.of(context).size.height;
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      controller: ScrollController(),
      itemCount: apiManager.bannersArray.length,
      itemBuilder: (context, index) {
        return buildContainerItem(index, h);
      },
    );
  }

  Widget buildContainerItem(int index, double h) {
    double w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: apiManager.bannersArray[index].bColor != null
              ? Color(int.parse(apiManager.bannersArray[index].bColor!
                  .replaceAll('#', '0xff')))
              : Colors
                  .transparent, // Parse color from string or fallback to transparent
          boxShadow: [
            const BoxShadow(
              color: Color.fromARGB(69, 143, 145, 135),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                apiManager.bannersArray[index].name ?? "",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: apiManager.bannersArray[index].cColor != null
                      ? Color(int.parse(apiManager.bannersArray[index].cColor!
                          .replaceAll('#', '0xff')))
                      : Colors.black,
                ),
              ),
            ),
            SizedBox(height: h * 0.001),
            buildGridView(index),
          ],
        ),
      ),
    );
  }

  Widget buildGridView(int index) {
    return GridView.builder(
      itemCount: jsonDecode(apiManager.bannersArray[index].serviceData!).length,
      controller: ScrollController(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 14 / 13,
        crossAxisCount: 4,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (BuildContext context, gridIndex) {
        return InkWell(
          onTap: () {
            callsingle(
                context,
                jsonDecode(
                    apiManager.bannersArray[index].serviceData!)[gridIndex]);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildCircleAvatar(
                index,
                jsonDecode(apiManager.bannersArray[index].serviceData!)[
                    gridIndex]["Image"],
              ),
              Text(
                jsonDecode(apiManager.bannersArray[index].serviceData!)[
                    gridIndex]["Name"],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: apiManager.bannersArray[index].cColor != null
                      ? Color(int.parse(apiManager.bannersArray[index].cColor!
                          .replaceAll('#', '0xff')))
                      : Colors
                          .black, // Set the text color based on bColor or fallback to black
                  // Add other text style properties here
                ),
                textAlign: TextAlign.center,
              )

              // Center text horizontally
            ],
          ),
        );
      },
    );
  }

  Widget buildCircleAvatar(int index, String gridIndex) {
    return CircleAvatar(
      backgroundColor: AppColors.SalmonColorColor.withOpacity(0.5),
      radius: 21,
      child: Image.network(
        "https://sonitechno.info/images/icon/$gridIndex",
        height: 25,
      ),
    );
  }

  void callsingle(BuildContext context, dynamic data) {
    if (data["Onoff"] == true) {
      if (data["ID"].toString() == "1") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Serch_contacts_Screen()),
        );
      } else if (data["ID"].toString() == "3") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Dth_Screen()),
        );
      } else if (data["ID"].toString() == "28") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FundTransferScreen()),
        );
        // }
      } else if (data["ID"].toString() == "16") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UpiTransferScreen()));
      } else if (data["ID"].toString() == "37") {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const DemtScreen()),
        // );
      }

      //

      else if (data["ID"].toString() == "17") {
        showDialoshowCustomDialog();
      } else if (data["ID"].toString() == "20") {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const UpiTransferScreen()),
        // );
      } else if (data["SectionType"].toString() == "2") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Bbps_screen(ServiceName: data["Name"].toString())),
        );
      }
    } else {
      MyGlobalFunctions.showAlert(context, data["Reason"].toString());
    }
  }

  void _BbpsItemClickon(BuildContext context, String selectedItem) {
    late String ServiceName = selectedItem;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Bbps_screen(ServiceName: selectedItem),
      ),
    );
  }
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        const CircularProgressIndicator(),
        Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Loading...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
