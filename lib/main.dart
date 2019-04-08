import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:uptaxi_all_cross_platform/UptaxiBlocDelegate.dart';
import 'package:uptaxi_all_cross_platform/available_services_screen/AvailableServicesScreen.dart';

import 'res/R.dart' as R;
import 'splash_screen/SplashScreen.dart';

void main(){
  new BlocSupervisor().delegate = new UpTaxiBlocDelegate();
  runApp(UpTaxiApplication());
}

class UpTaxiApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: R.RouteNames.splashScreenRoute,
      routes: {
        R.RouteNames.chooseServiceRoute : (context)=>AvailableServicesScreen()
      },
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: R.Styles.upTaxiAppTheme,
    );
  }
}
