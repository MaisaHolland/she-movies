import 'dart:convert';

import 'package:flutter/services.dart';

Future<List<Map<String, dynamic>>> loadMockFromAssets(String nameFile) async {
  List data =
      jsonDecode(await rootBundle.loadString('assets/mocks/$nameFile.json'));
  return data.map((e) => e as Map<String, dynamic>).toList();
}

