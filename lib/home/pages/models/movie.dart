

enum MovieType {
  popular,
  newest,
}

Map<String, MovieType> stringToMovieType = {
  'popular': MovieType.popular,
  'newest': MovieType.newest,
};

class Movie {
  final String rate;
  final String image;
  final MovieType category;

  Movie({
    required this.rate,
    required this.image,
    required this.category,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      rate: json['rate'].toString(),
      image: json['image'],
      category: stringToMovieType[json['category']]!,
    );
  }
}
