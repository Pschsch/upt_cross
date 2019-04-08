
class AvailableService{
  int firmId;
  int serviceId;
  String country;
  String city;
  String service;
  String ip;
  String port;
  String tariff;

  AvailableService(
      {this.firmId,
        this.serviceId,
        this.country,
        this.city,
        this.service,
        this.ip,
        this.port,
        this.tariff});

  AvailableService.fromJson(Map<String, dynamic> json) {
    firmId = json['firm_id'];
    serviceId = json['service_id'];
    country = json['country'];
    city = json['city'];
    service = json['service'];
    ip = json['ip'];
    port = json['port'];
    tariff = json['tariff'];
  }
}