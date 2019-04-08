import 'AvailableService.dart';


class AvailableServicesResponse{
  String status;
  int id;
  List<AvailableService> data;

  AvailableServicesResponse({this.status, this.id, this.data});

  AvailableServicesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
    if (json['data'] != null) {
      data = new List<AvailableService>();
      json['data'].forEach((v) {
        data.add(new AvailableService.fromJson(v));
      });
    }
  }


}