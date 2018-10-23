import 'unit.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

class Api {
  final httpClient = HttpClient();
  final url = 'flutter.udacity.com';

  Future<double> convert(
      String category, String fromUnit, String toUnit, String amount) async {
    final uri = Uri.https(url, '/$category/convert',
        {'amount': amount, 'from': fromUnit, 'to': toUnit});

    final jsonResponse = await _getJson(uri);
    print(uri);
    print(jsonResponse);
    return jsonResponse['conversion'].toDouble();
  }

  Future<List<Unit>> getUnits(String category) async {
    List<Unit> unitList = new List<Unit>();
    final uri = Uri.https(url, '/$category');

    final jsonResponse = await _getJson(uri);
    var _units = jsonResponse['units'];
    print(_units);
    for (var unit in _units) {
      unitList.add(Unit(
          name: unit['name'],
          conversion: unit['conversion'].toDouble(),
          description: unit['description']));
    }
    return unitList;
  }

  Future<Map<String, dynamic>> _getJson(Uri uri) async {
    try {
      final httpRequest = await httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != HttpStatus.ok) {
        return null;
      }
      // The response is sent as a Stream of bytes that we need to convert to a
      // `String`.
      final responseBody = await httpResponse.transform(utf8.decoder).join();
      // Finally, the string is parsed into a JSON object.
      return json.decode(responseBody);
    } on Exception catch (e) {
      print('$e');
      return null;
    }
  }
}
