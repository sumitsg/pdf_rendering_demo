import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';

class NetworkPdf extends StatelessWidget {
  const NetworkPdf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = 'http://www.africau.edu/images/default/sample.pdf';
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF from Network'),
      ),
      body: PDF.network(url),
    );
  }
}
