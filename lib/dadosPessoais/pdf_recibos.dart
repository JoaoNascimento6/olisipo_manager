import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:open_file/open_file.dart';

Future<void> PDFrecibos(
  String name,
  String contribuinte,
  String mes,
  int ano,
) async {
  // Create a new PDF document
  PdfDocument document = PdfDocument();

  // Add a new page
  PdfPage page = document.pages.add();

  // Set font
  PdfFont font = PdfStandardFont(PdfFontFamily.helvetica, 12);

  Future<PdfBitmap> _loadImage(String imagePath) async {
    final ByteData data = await rootBundle.load(imagePath);
    final Uint8List bytes = data.buffer.asUint8List();
    return PdfBitmap(bytes);
  }

  final PdfBitmap image = await _loadImage('images/olisipo.png');

  // Calculate the center of the page
  double centerX = page.getClientSize().width / 2;
  double centerY = page.getClientSize().height / 2;

  // Text content
  String texto1 =
      'A empresa Olisipo declara que efetuou o pagamento ao colaborador $name, portador do número de contribuinte $contribuinte, relativo ao mês de $mes de $ano.';
  String texto2 =
      'Este recibo serve como comprovativo do pagamento mencionado acima.';
  String texto3 = 'Atenciosamente, Olisipo.';

  page.graphics.drawImage(
    image,
    Rect.fromLTWH(
        centerX - 100, centerY - 300, 200, 100), // Ajuste de posição e tamanho
  );

// Draw título
  String titulo = 'Recibo de Vencimento - $mes de $ano';
  page.graphics.drawString(
    titulo,
    PdfStandardFont(PdfFontFamily.helvetica, 16, style: PdfFontStyle.bold),
    brush: PdfSolidBrush(PdfColor(0, 0, 0)),
    format: PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    ),
    bounds: Rect.fromLTWH(centerX - 250, centerY - 250, 500, 200),
  );

// Draw texto1
  page.graphics.drawString(
    texto1,
    font,
    brush: PdfSolidBrush(PdfColor(0, 0, 0)),
    format: PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    ),
    bounds: Rect.fromLTWH(centerX - 250, centerY - 160, 500, 200),
  );

// Draw texto2 abaixo de texto1
  page.graphics.drawString(
    texto2,
    font,
    brush: PdfSolidBrush(PdfColor(0, 0, 0)),
    format: PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    ),
    bounds: Rect.fromLTWH(centerX - 250, centerY - 100, 500, 200),
  );

// Draw texto3 abaixo de texto2
  page.graphics.drawString(
    texto3,
    font,
    brush: PdfSolidBrush(PdfColor(0, 0, 0)),
    format: PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    ),
    bounds: Rect.fromLTWH(centerX - 250, centerY - 80, 500, 200),
  );

  // Save the document
  List<int> bytes = await document.save();

  // Dispose the document
  document.dispose();

  // Get external storage directory
  final directory = await getApplicationSupportDirectory();

  // Get directory path
  final path = directory.path;

  // Create an empty file to write PDF data
  File file = File('$path/ReciboVencimento$mes.$ano.pdf');

  // Write PDF data
  await file.writeAsBytes(bytes, flush: true);

  // Open the PDF document in a viewer
  OpenFile.open('$path/ReciboVencimento$mes.$ano.pdf');
}
