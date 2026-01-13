import 'package:domain/repository/movie_repository.dart';
import 'package:sky_club/presentation/base/base_binding.dart';
import 'package:sky_club/presentation/feature/home/movie_list/movie_list_view_model.dart';

class MovieListBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    MovieRepository movieRepository = await diModule.resolve<MovieRepository>();
    return diModule.registerInstance(
      MovieListViewModel(movieRepository: movieRepository),
    );
  }

  @override
  Future<void> removeDependencies() {
    return diModule.unregister<MovieListViewModel>();
  }
}
