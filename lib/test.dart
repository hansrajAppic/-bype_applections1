import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:mantra_biometric/mantra_biometric.dart';
import 'package:mantra_biometric/utils/mantra_plugin_exception.dart';
import 'package:xml/xml.dart';
import 'package:collection/collection.dart';

void main() {
  runApp(MaterialApp(home: const pay()));
}

class pay extends StatefulWidget {
  const pay({super.key});

  @override
  State<pay> createState() => _MyAppState();
}

class _MyAppState extends State<pay> {
  final _mantraBiometricPlugin = MantraBiometric();

  @override
  void initState() {
    super.initState();
  }

  displyAlert(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(message),
            ));
  }

  String result = "";

  getDeviceInfo() async {
    try {
      String output = await _mantraBiometricPlugin.getDeviceInformation() ?? "";
      result = output;
      setState(() {});
    } on RDClientNotFound catch (e) {
      displyAlert("Install Clinet");
    } catch (e) {
      displyAlert("Something Went Wrong");
    }
  }

  scanFingerPrint() async {
    try {
      String wadh = "";
      String pidOptions =
          "<PidOptions ver=\"1.0\"> <Opts fCount=\"1\" fType=\"2\" pCount=\"0\" format=\"0\" pidVer=\"2.0\" wadh=\"$wadh\" timeout=\"20000\"  posh=\"UNKNOWN\" env=\"P\" /> </PidOptions>";
      result = await _mantraBiometricPlugin.captureFingerPrint(
              pidOptions: pidOptions) ??
          "";

      setState(() {});
    } on RDClientNotFound catch (e) {
      log("${e.code}");
      displyAlert("Install Clinet");
    } catch (e) {
      displyAlert("Something Went Wrong ${e.runtimeType} $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mantra Biometric Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            
            MaterialButton(
              onPressed: getDeviceInfo,
              child: const Text("Get Device Information"),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: scanFingerPrint,
              child: const Text("Scan Fingure Print"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("$result")
          ],
        ),
      ),
    );

  }
}
