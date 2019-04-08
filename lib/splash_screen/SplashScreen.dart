import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptaxi_all_cross_platform/backend_and_data_classes/Repository.dart';
import 'package:uptaxi_all_cross_platform/res/R.dart' as R;
import 'package:uptaxi_all_cross_platform/splash_screen/splash_screen_bloc/SplashScreenEvent.dart';

import 'splash_screen_bloc/SplashScreenBloc.dart';
import 'splash_screen_bloc/bloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  State createState() {
    return new _SplashScreenState();
  }
}

///[Logic]

class _SplashScreenState extends State<SplashScreen> {
  final ListOfServicesRepository _repository = new ListOfServicesRepository();
  SplashScreenBloc _splashScreenBloc;
  GlobalKey<ScaffoldState> _splashScaffold = new GlobalKey();

  @override
  void initState() {
    super.initState();
    _splashScreenBloc = new SplashScreenBloc(_repository, _splashScaffold);
    _splashScreenBloc.dispatch(UpTaxiAppStarted());
  }

  @override
  void dispose() {
     _splashScreenBloc.dispose();
     super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _splashScaffold,
        body: new BlocBuilder(
          bloc: _splashScreenBloc,
          builder: (BuildContext c, SplashScreenState state){
            if(state is SuccessfulServicesLoad){
             WidgetsBinding.instance.addPostFrameCallback((_)=>_enterServicesScreen(c));
            }
              return getFullSplashScreen();
          },
        )
    );
  }

  void _enterServicesScreen(BuildContext c){
    Navigator.of(c).pushNamed(R.RouteNames.chooseServiceRoute);
  }

  ///[Views]

  Container getFullSplashScreen(){
    return new Container(
      decoration: getUpTaxiBackground(),
      child: getUpTaxiSplashScreen(),
    );
  }

  Stack getUpTaxiSplashScreen() {
    return new Stack(
      children: <Widget>[
        new Align(child: getUpTaxiLogo(), alignment: Alignment.center),
        new Align(
            alignment: Alignment.bottomCenter,
            child: new Padding(
                padding: EdgeInsets.only(bottom: 32), child: getProgress())),
      ],
    );
  }

  Decoration getUpTaxiBackground() {
    return new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage(R.Drawables.upTaxiBackground),
            fit: BoxFit.cover));
  }

  Image getUpTaxiLogo() {
    return new Image.asset(R.Drawables.upTaxiLogo);
  }

  Container getProgress() {
    return new Container(
        height: 4,
        child: new LinearProgressIndicator(
            backgroundColor: R.Colors.colorBlindAccent));
  }

}
