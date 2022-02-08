import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';

class FilePdf extends StatelessWidget {
  File file;
  FilePdf({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF from Assets'),
      ),
      body: PDF.file(file),
    );
  }
}
