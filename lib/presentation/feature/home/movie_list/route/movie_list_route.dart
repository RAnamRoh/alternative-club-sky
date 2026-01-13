import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/feature/home/movie_list/movie_list_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/home/movie_list/route/movie_list_argument.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';

class MovieListRoute extends BaseRoute<MovieListArgument> {
  @override
  RoutePath routePath = RoutePath.movieList;

  MovieListRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(builder: (_) => const MovieListAdaptiveUi());
  }
}
