import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PdfViewer extends StatefulWidget {
  const PdfViewer({Key key}) : super(key: key);

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();

    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/reglamento.pdf');

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
          body: Center(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : PDFViewer(
                document: document,
                showPicker: false,
              ),
      ),
    );
  }
}
