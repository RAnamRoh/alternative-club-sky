import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_argument.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';

abstract class BaseRoute<A extends BaseArgument> {
  abstract RoutePath routePath;
  A? arguments;

  BaseRoute({this.arguments});

  MaterialPageRoute toMaterialPageRoute();
}
