import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:uptaxi_all_cross_platform/backend_and_data_classes/Repository.dart';
import 'package:uptaxi_all_cross_platform/backend_and_data_classes/dart_data_objects/get_available_data/AvailableServicesResponse.dart';

import 'bloc.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState>{

  ListOfServicesRepository _repository;
  GlobalKey<ScaffoldState> _key;
  SplashScreenBloc _bloc;

  SplashScreenBloc(Repository repository, GlobalKey<ScaffoldState> key){
    this._repository = repository;
    this._key = key;
    this._bloc = this;
  }

  @override
  SplashScreenState get initialState {
     return NotLoadedYet();
  }

  @override
  Stream<SplashScreenState> mapEventToState(SplashScreenEvent event) async* {
    if(event is UpTaxiAppStarted) {
      yield* startUpTaxiApp();
    }
  }

  Stream<SplashScreenState> startUpTaxiApp() async* {
    try {
      AvailableServicesResponse response = await _repository.getData();
      yield SuccessfulServicesLoad(response);
    } catch(error){
      yield UnsuccessfulServicesLoad(_key, _bloc);
    }
  }
}