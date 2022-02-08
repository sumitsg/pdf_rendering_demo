import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';

class AssetPdf extends StatelessWidget {
  const AssetPdf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF from Assets'),
      ),
      body: PDF.asset('assets/dartsheet.pdf'),
    );
  }
}
