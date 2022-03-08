import 'dart:convert';

import 'package:movie_app/models/movie_model.dart';
import 'package:http/http.dart';
import 'package:movie_app/services/network_service.dart';

class MovieRepository {
  static MovieRepository? _instace;
  static MovieRepository get instance {
    if (_instace != null) _instace!;

    _instace = MovieRepository._init();
    return _instace!;
  }

  MovieRepository._init();

  Future<List<Movie>> getMovies() async {
    String endpoint = "Top250TVs";

    final moviesRaw = await NetworkService.instance.apiGet(endpoint);
    List movies = moviesRaw["items"] as List;

    return movies.map((e) => Movie.fromJson(e)).toList();
  }
}
