// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:pdf_rendering_demo/pages/assetpdf.dart';
import 'package:pdf_rendering_demo/pages/filepdf.dart';
import 'package:pdf_rendering_demo/pages/networkpdf.dart';
import 'package:pdf_rendering_demo/pages/sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = 'http://www.africau.edu/images/default/sample.pdf';
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PDF Rendering'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AssetPdf()));
                  },
                  child: const Text('PDF from Assets')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NetworkPdf()));
                  },
                  child: const Text('PDF from Network')),
              ElevatedButton(
                onPressed: () async {
                  // ? Pick the file from your storage
                  FilePickerResult result = await FilePicker.platform.pickFiles(
                    allowedExtensions: ['pdf'],
                    type: FileType.custom,
                  );
                  // ignore: unnecessary_null_comparison
                  if (result != null) {
                    File pickedFile = File(
                      result.files.single.path,
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FilePdf(file: pickedFile)));
                  } else {}
                },
                child: const Text('PDF from file'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SamplePage()));
                  },
                  child: const Text('To the Sample page')),
            ],
          ),
        ));
  }
}
