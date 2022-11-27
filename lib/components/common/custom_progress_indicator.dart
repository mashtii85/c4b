import 'package:c4b/config/fixture_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum ProgressIndicatorType {
  DoubleBounce,
  RotatingPlain,
  WanderingCubes,
  Wave,
  FadingCube,
  Pulse,
  ChasingDots,
  ThreeBounce,
  CubeGrid
}

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator(
      {super.key,
      this.size = 70,
      this.type = ProgressIndicatorType.CubeGrid,
      this.color = Colors.white});

  final double size;
  final Color color;
  final ProgressIndicatorType type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ProgressIndicatorType.DoubleBounce:
        return SizedBox(
            width: size,
            height: size,
            child: SpinKitDoubleBounce(
              color: color,
              size: size,
            ));

      case ProgressIndicatorType.RotatingPlain:
        return SizedBox(
            width: size,
            height: size,
            child: SpinKitRotatingPlain(
              color: color,
              size: size,
            ));

      case ProgressIndicatorType.WanderingCubes:
        return SizedBox(
            width: size,
            height: size,
            child: SpinKitWanderingCubes(
              color: fixtures.colorPalette.white,
              size: size,
            ));

      case ProgressIndicatorType.Wave:
        return SizedBox(
            width: size,
            height: size,
            child: SpinKitWave(
              color: color,
              size: size,
            ));

      case ProgressIndicatorType.FadingCube:
        return SizedBox(
          width: size,
          height: size,
          child: SpinKitFadingCube(
            color: color,
            size: size,
          ),
        );

      case ProgressIndicatorType.Pulse:
        return SizedBox(
          width: size,
          height: size,
          child: SpinKitPulse(
            color: color,
            size: size,
          ),
        );

      case ProgressIndicatorType.ChasingDots:
        return SizedBox(
            width: size,
            height: size,
            child: SpinKitChasingDots(
              color: color,
              size: size,
            ));

      case ProgressIndicatorType.ThreeBounce:
        return SizedBox(
            width: size,
            height: size,
            child: SpinKitThreeBounce(
              color: color,
              size: size,
            ));

      case ProgressIndicatorType.CubeGrid:
        return SizedBox(
            width: size,
            height: size,
            child: SpinKitCubeGrid(
              color: color,
              size: size,
            ));
      default:
        return SizedBox(
            width: size,
            height: size,
            child: SpinKitCubeGrid(
              color: color,
              size: size,
            ));
    }
  }
}
