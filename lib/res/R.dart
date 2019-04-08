import 'package:flutter/material.dart' as material;

class Styles{
  static final material.ThemeData upTaxiAppTheme = material.ThemeData(
      accentColor: Colors.colorAccent,
      primaryColor: Colors.colorPrimary
  );
}

class Strings{
  static const String chooseCountry = 'Выберите страну';
  static const String chooseTown = 'Выберите город';
  static const String chooseService = 'Выберите службу';
  static const String connectionError = 'Произошла ошибка подключения к UpTaxi. Повторить?';
  static const String retry = 'Повторить?';
}

class Colors{
  static final material.Color colorAccent = material.Colors.amber[400];
  static final material.Color colorPrimary = material.Colors.yellow[500];
  static final material.Color colorOrange = material.Colors.orange;
  static final material.Color colorBlindAccent = material.Colors.amber[200];
  static final material.Color colorTransientBar = material.Colors.deepOrange[900];
}

class Drawables{
  static const String _path = 'assets/';
  static const String upTaxiBackground = "${_path}uptaxi_background.jpg";
  static const String upTaxiLogo = "${_path}logo_new.png";
}

class Urls{
  static const String _baseKvsUrl = "https://kvs.uptaxi.ru/apim/v1/ru/";
  static const String getServicesUrl = "${_baseKvsUrl}services/get/available";
}

class RouteNames{
  static const String splashScreenRoute = "/";
  static const String chooseServiceRoute = "/choose_service";
}

class Events{
  static const String upTaxiStarted = "UpTaxiClientAppStarted";
  static const String listOfServicesLoaded = "ListOfServicesLoaded";
}

class States{
  static const String appNotLoadedYet = "AppNotLoadedYet";
  static const String appLoadedSuccessfully = "AppLoadedSuccessfully";
  static const String appLoadedUnsuccessfully = "AppLoadedUnsuccessfully";
}