class Movie {
  final int? year, numOfRatings, criticsReview, metascoreRating;
  final double? rating;
  final List<String>? genres;
  final String? id, name, plot, title, fullTitle, poster, backdrop;
  final List<Map>? cast;
  final double? rank;
  final String? image;
  final String? crew;
  final double? imDbRating;
  final int? imDbRatingCount;

  Movie({
    this.id,
    this.year,
    this.name,
    this.numOfRatings,
    this.criticsReview,
    this.metascoreRating,
    this.rating,
    this.genres,
    this.plot,
    this.title,
    this.poster,
    this.backdrop,
    this.cast,
    this.rank,
    this.image,
    this.imDbRating,
    this.imDbRatingCount,
    this.crew,
    this.fullTitle,
  });

  Movie.fromJson(Map json)
      : id = json["id"],
        year = int.tryParse(json["year"]),
        title = json["title"],
        rank = double.tryParse(json["rank"]),
        image = json["image"],
        imDbRating = double.tryParse(json["imDbRating"]),
        imDbRatingCount = int.tryParse(json["imDbRatingCount"]),
        name = json["name"],
        numOfRatings = json["numOfRatings"],
        criticsReview = json["criticsReview"],
        metascoreRating = json["metascoreRating"],
        rating = json["rating"],
        genres = json["genres"],
        plot = json["plot"],
        poster = json["poster"],
        backdrop = json["backdrop"],
        crew = json["crew"],
        fullTitle = json["fullTitle"],
        cast = json["cast"];
}

List<Movie> moviess = [
  Movie(
    id: "1",
    title: "Bloodshot",
    year: 2020,
    poster: "assets/images/poster_1.jpg",
    backdrop: "assets/images/backdrop_1.jpg",
    numOfRatings: 150212,
    rating: 7.3,
    criticsReview: 50,
    metascoreRating: 76,
    genres: ["Action", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
  Movie(
    id: "2",
    title: "Ford v Ferrari ",
    year: 2019,
    poster: "assets/images/poster_2.jpg",
    backdrop: "assets/images/backdrop_2.jpg",
    numOfRatings: 150212,
    rating: 8.2,
    criticsReview: 50,
    metascoreRating: 76,
    genres: ["Action", "Biography", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
  Movie(
    id: "1",
    title: "Onward",
    year: 2020,
    poster: "assets/images/poster_3.jpg",
    backdrop: "assets/images/backdrop_3.jpg",
    numOfRatings: 150212,
    rating: 7.6,
    criticsReview: 50,
    metascoreRating: 79,
    genres: ["Action", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
];

String plotText =
    "American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.";
