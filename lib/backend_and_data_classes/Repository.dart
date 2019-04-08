import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uptaxi_all_cross_platform/res/R.dart' as R;

import 'dart_data_objects/get_available_data/AvailableServicesResponse.dart';

abstract class Repository{
  Future<dynamic> getData();
}

class ListOfServicesRepository extends Repository{
  AvailableServicesResponse response;

  @override
  Future<AvailableServicesResponse> getData() async {
      http.Response response = await http.post(R.Urls.getServicesUrl);
      Map availableServicesJson = jsonDecode(response.body);
      return AvailableServicesResponse.fromJson(availableServicesJson);
  }

}