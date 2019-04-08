import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uptaxi_all_cross_platform/backend_and_data_classes/dart_data_objects/get_available_data/AvailableServicesResponse.dart';
import 'package:uptaxi_all_cross_platform/res/R.dart' as R;
import 'package:uptaxi_all_cross_platform/splash_screen/splash_screen_bloc/bloc.dart';
import 'package:uptaxi_all_cross_platform/widgets/ErrorSnackbar.dart';


abstract class SplashScreenState extends Equatable{
  SplashScreenState([List props = const[]]) : super(props);
}

class NotLoadedYet extends SplashScreenState{
  @override
  String toString() => R.States.appNotLoadedYet;
}

class SuccessfulServicesLoad extends SplashScreenState{

  AvailableServicesResponse _resp;

  AvailableServicesResponse get resp => _resp;

  SuccessfulServicesLoad(AvailableServicesResponse resp){
    this._resp = resp;
  }

  @override
  String toString() => R.States.appLoadedSuccessfully;
}

class UnsuccessfulServicesLoad extends SplashScreenState{
  SplashScreenBloc _bloc;

  UnsuccessfulServicesLoad(GlobalKey<ScaffoldState> key, SplashScreenBloc bloc){
    key.currentState.showSnackBar(
        ErrorSnackbar(
            text: R.Strings.connectionError,
            color: R.Colors.colorTransientBar,
            actionLabel: R.Strings.retry,
            onPressed: (){
              _bloc.dispatch(UpTaxiAppStarted());
            }));
    this._bloc = bloc;
  }
  @override
  String toString() => R.States.appLoadedUnsuccessfully;
}