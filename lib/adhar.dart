// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void main() {
//   runApp(ppppp());
// }
//
// class ppppp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Aadhar Validation',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: AadharValidationScreen(),
//     );
//   }
// }
//
// class AadharValidationScreen extends StatefulWidget {
//   @override
//   _AadharValidationScreenState createState() => _AadharValidationScreenState();
// }
//
// class _AadharValidationScreenState extends State<AadharValidationScreen> {
//   final TextEditingController _aadhaarController = TextEditingController();
//   String _validationMessage = '';
//
//   @override
//   void dispose() {
//     _aadhaarController.dispose();
//     super.dispose();
//   }
//
//   void _validateAadhaar(String aadhaar) {
//     final cleanedAadhaar = aadhaar.replaceAll(' ', '');
//
//     if (cleanedAadhaar.length != 12) {
//       setState(() {
//         _validationMessage = 'Aadhaar must be exactly 12 digits.';
//       });
//       return;
//     }
//
//     if (cleanedAadhaar.substring(0, 1) == '0' || cleanedAadhaar.substring(0, 1) == '1') {
//       setState(() {
//         _validationMessage = 'Aadhaar should not start with 0 or 1.';
//       });
//       return;
//     }
//
//     final validCharacters = RegExp(r'^[0-9]+$');
//     if (!validCharacters.hasMatch(cleanedAadhaar)) {
//       setState(() {
//         _validationMessage = 'Aadhaar must contain only digits.';
//       });
//       return;
//     }
//
//     setState(() {
//       _validationMessage = 'Aadhaar is valid.';
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Aadhar Validation'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextField(
//                   controller: _aadhaarController,
//                   keyboardType: TextInputType.number,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     LengthLimitingTextInputFormatter(14), // Limit length including spaces
//                     // Inline AadhaarNumberInputFormatter logic
//                     TextInputFormatter.withFunction((oldValue, newValue) {
//                       final text = newValue.text.replaceAll(' ', '');
//                       final buffer = StringBuffer();
//
//                       for (int i = 0; i < text.length; i++) {
//                         buffer.write(text[i]);
//                         if (i % 4 == 3 && i != text.length - 1) {
//                           buffer.write(' ');
//                         }
//                       }
//
//                       final newText = buffer.toString();
//                       return newValue.copyWith(
//                         text: newText,
//                         selection: TextSelection.collapsed(offset: newText.length),
//                       );
//                     }),
//                   ],
//                   decoration: InputDecoration(
//                     hintText: 'Enter Aadhaar Number',
//                     labelText: 'Aadhaar Number',
//                     errorText: _validationMessage.isNotEmpty ? _validationMessage : null,
//                   ),
//                 ),
//                 SizedBox(height: 10.0), // Add some space
//               ],
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _validateAadhaar(_aadhaarController.text);
//               },
//               child: Text('Validate'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRCodeScannerTextField extends StatefulWidget {
  @override
  _QRCodeScannerTextFieldState createState() => _QRCodeScannerTextFieldState();
}

class _QRCodeScannerTextFieldState extends State<QRCodeScannerTextField> {
  TextEditingController _controller = TextEditingController();
  String _scanResult = 'Unknown';

  Future<void> _scanQRCode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _controller.text = barcodeScanRes;
      _scanResult = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Code Scanner with TextField')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               IconButton(
          icon: Icon(Icons.qr_code),
          onPressed: _scanQRCode,
        ),
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Scan QR Code',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.qr_code),
                    onPressed: _scanQRCode,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Submit action
                },
                child: Text('Submitdd'),
              ),
              SizedBox(height: 20),
              Text('Scan result: $_scanResult', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}


