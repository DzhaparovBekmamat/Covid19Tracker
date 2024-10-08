import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../../models/country_report.dart';
import '../../utils/constants.dart';

class GetCountriesReportApi {
  final _uri =
      Uri.parse('${ApiConstants.kBaseUrl}${ApiConstants.kCountriesEndPoint}');

  Future<List<CountryReport>> fetchCountriesReport() async {
    try {
      http.Response response = await http.get(_uri);
      if (response.statusCode == 200) {
        List decodedList = convert.jsonDecode(response.body);
        List<CountryReport> countryReportList = decodedList
            .map((mapElement) => CountryReport.fromMap(mapElement))
            .toList();
        return countryReportList;
      } else {
        throw 'Something went wrong';
      }
    } catch (error) {
      throw error.toString();
    }
  }
}
