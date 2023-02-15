import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';

class CsvModel {
  final List<dynamic> headers;
  final List<List<dynamic>> rows;

  CsvModel({required this.headers, required this.rows});

  @override
  String toString() {
    return 'CsvModel{headers: $headers, rows: $rows}';
  }
}

class CsvService {
  CsvService._();

  static Future<CsvModel> readCsv(PlatformFile file) async {
    final input = await File(file.path!).readAsLines();
    // Make one string from the list of strings with CRLF as line ending
    final inputString = input.join('\r\n');
    final csv = const CsvToListConverter().convert(inputString);
    return CsvModel(headers: csv.first, rows: csv.skip(1).toList());
  }

  static Future<File> exportAsCsv(CsvModel csv) async {
    final List<List> csvRows = [csv.headers];
    csvRows.addAll(csv.rows);
    final String csvString = const ListToCsvConverter().convert(csvRows);
    final File file = File('export.csv');
    await file.writeAsString(csvString);
    return file;
  }
}
