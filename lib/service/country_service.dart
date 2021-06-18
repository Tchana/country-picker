import 'dart:convert';

import 'package:getx_internationalization/models/country.dart';
import 'package:http/http.dart' as http;
import 'package:http_utils/http_utils.dart';

class CountryService {
  static Future<List<Country>> fetchCountries() async {
    List<Country> responses = List.empty(growable: true);
    final response = await http.get(
      Uri.https("restcountries.eu", "rest/v2/all"),
    );

    if (response.statusCode == HttpStatus.HTTP_200_OK) {
      print("Inside Fetch Countries");

      // print(jsonDecode(response.body));
      final countryList = jsonDecode(response.body);
      print(countryList);

      for (var d in countryList) {
        print('IN THE FOR LOOP');
        print(Country.fromJson(d as Map<String, dynamic>));
        responses.add(Country.fromJson(d as Map<String, dynamic>));
      }

      return responses;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to  FETCH Customer');
    }
  }
}
