import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Globale_class/colors.dart';

void main() => runApp(const NSDLPAN());

class NSDLPAN extends StatelessWidget {
  const NSDLPAN({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NSDL Plan Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: NsdlPlanScreen(),
    );
  }
}

class NsdlPlanScreen extends StatelessWidget {
  final List<double> radii = [20.0, 30.0, 40.0, 50.0, 60.0];

  final List<Map<String, String>> plans = [
    {
      'planName': 'Opening Balance',
      'planDescription': 'MAX: 0.00',
      'price': '\$50/month',
    },
    {
      'planName': 'Fund Add',
      'planDescription': 'MAX: 0.00',
      'price': '\$30/month',
    },
    {
      'planName': 'APES',
      'planDescription': 'MAX: 0.00',
      'price': '\$40/month',
    },
    {
      'planName': 'Closing Balance',
      'planDescription': 'MAX: 0.00',
      'price': '\$60/month',
    },
    {
      'planName': 'Demt',
      'planDescription': 'MAX: 0.00',
      'price': '\$45/month',
    },
    {
      'planName': 'Recharge',
      'planDescription': 'MAX: 0.00',
      'price': '\$35/month',
    },
    {
      'planName': 'Payout',
      'planDescription': 'MAX: 0.00',
      'price': '\$55/month',
    },
    {
      'planName': 'MATM',
      'planDescription': ' MATM service.',
      'price': '\$45/month',
    },
    {
      'planName': 'Pan',
      'planDescription': 'MAX: 0.00',
      'price': '\$40/month',
    },
    {
      'planName': 'AdharPay',
      'planDescription': 'MAX: 0.00',
      'price': '\$50/month',
    },
    {
      'planName': 'Upi',
      'planDescription': 'MAX: 0.00',
      'price': '\$40/month',
    },
  ];

  @override
  Widget build(BuildContext context) {double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.redColor,
      //   title: Text("Hansraj YOGI",style: TextStyle(
      //     fontSize: 15,fontWeight: FontWeight.w500,
      //     // Change font size as needed
      //     color: Colors.white, ) ,
      //
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: AppColors.redColor,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Hansraj YOGI",
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w300,
              color: AppColors.whiteColor
          ),
        ),
        centerTitle: true,
        actions: [

          IconButton(
            icon: const Icon(Icons.star, color: AppColors.whiteColor),
            onPressed: () {
              // Handle rating icon pressed
            },
          ),
          IconButton(
            icon: const Icon( Icons.help_outline_outlined,color: AppColors.whiteColor),
            onPressed: () {
              // Handle rating icon pressed
            },
          ),

        ],
      ),
      body:
      Column(
        children: [
          Container(
            height: h * 0.16,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff303948), // Start color
                  Color(0xffcc3033), // End color
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Align(alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, // Align children to the end
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Main Wallet :null",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16, // Adjust font size as needed
                        fontWeight: FontWeight.bold, // Make text bold
                        // fontFamily: 'YourFontFamily', // Add your desired font family here
                      ),
                    ),
                    Text(
                      "AEPS Main Wallet :null",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16, // Adjust font size as needed
                        fontWeight: FontWeight.bold, // Make text bold
                        // fontFamily: 'YourFontFamily', // Add your desired font family here
                      ),
                    ),
                    Text(
                      "History",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27, // Adjust font size as needed
                        fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic // Make text bold
                        // fontFamily: 'YourFontFamily', // Add your desired font family here
                      ),
                    ),
                    Divider( // Add Divider widget
                      color: Colors.white,
                      thickness: 2.0,// Set color to white
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: plans.length,
              itemBuilder: (context, index) {
                final plan = plans[index];
                return PlanCard(
                  planName: plan['planName']!,
                  planDescription: plan['planDescription']!,
                  price: plan['price']!,
                  radius: radii[index % radii.length], // Ensuring valid radius value
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final String planName;
  final String planDescription;
  final String price;
  final double radius;

  PlanCard({
    required this.planName,
    required this.planDescription,
    required this.price,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
    return Column(
      children: [


        Card(
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  planName,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                // SizedBox(height: 8.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       planDescription,
                //       style: TextStyle(fontSize: 16),
                //     ),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            planDescription,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 8), // Adjust the width as needed
                        ],
                      ),
                    ),
                    Container(alignment: Alignment.center,
                      // Adjust the width as needed
                      decoration: BoxDecoration(
                        color: const Color(0xff01a109),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child:Padding(
                        padding: EdgeInsets.symmetric(horizontal:w*0.05,vertical: h*0.003 ),
                        child: const Text("Commission:0.00",style: TextStyle(
                          fontSize: 15,fontWeight: FontWeight.w500,
                          // Change font size as needed
                          color: Colors.white, ) ,

                          ),
                      )
                    ),
                  ],
                ),


                const SizedBox(height: 8.0),
                const SizedBox(height: 8.0),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(radius),
                      topLeft: Radius.circular(radius),
                    ),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(radius),
                      topLeft: Radius.circular(radius),
                    ),
                    child: const LinearProgressIndicator(
                      value: 8,
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xff01a109)),
                      backgroundColor: Color(0xffa7f3ab),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

