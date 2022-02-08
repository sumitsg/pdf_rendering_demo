// ignore: unused_import
import 'dart:io';

// ignore: import_of_legacy_library_into_null_safe
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  SamplePageState createState() => SamplePageState();
}

class SamplePageState extends State<SamplePage> {
  String? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sample page'),
      ),
      body: Center(
        child: file != null
            ? PDFView(
                filePath: file,
                fitEachPage: true,
                onError: (error) {
                  print(error.toString());
                },
              )
            : ElevatedButton(
                onPressed: () async {
                  FilePickerResult result = await FilePicker.platform.pickFiles(
                    allowedExtensions: ['pdf'],
                    type: FileType.custom,
                  );
                  if (result != null) {
                    print(result.files.single.path);
                    setState(() {
                      file = result.files.single.path;
                    });
                  }
                },
                child: const Text('Get the File')),
      ),
    );
  }
}
