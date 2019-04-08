import 'package:equatable/equatable.dart';
import 'package:uptaxi_all_cross_platform/res/R.dart' as R;

abstract class SplashScreenEvent extends Equatable{
  SplashScreenEvent([List props = const[]]) : super(props);
}

class UpTaxiAppStarted extends SplashScreenEvent{
  @override
  String toString() => R.Events.upTaxiStarted;
}
