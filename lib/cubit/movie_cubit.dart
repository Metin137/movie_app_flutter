import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/services/movie_repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieRepository repository = MovieRepository.instance;
  MovieCubit() : super(const MovieInitial());

  void getMovies() {
    repository.getMovies().then((movies) {
      emit(MovieLoaded(movies: movies));
    });
  }
}
