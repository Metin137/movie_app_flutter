part of 'movie_cubit.dart';

@immutable
abstract class MovieState {
  const MovieState();
}

class MovieInitial extends MovieState {
  const MovieInitial();
}

class MovieLoading extends MovieState {
  const MovieLoading();
}

class MovieError extends MovieState {
  final String error;
  const MovieError({required this.error});
}

class MovieLoaded extends MovieState {
  final List<Movie>? movies;
  const MovieLoaded({required this.movies});
}
