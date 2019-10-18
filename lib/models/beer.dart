class Beer {
  final int id;
  final String beerName;
  final String imageUrl;
  final int abv;
  final String description;
  final String beerStyle;
  final int rating;

  final String breweryName;
  final String breweryCity;
  final String breweryState;

  Beer.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap["bid"],
        beerName = jsonMap["beer_name"],
        imageUrl = jsonMap["beer_label"],
        abv = jsonMap["beer_abv"],
        description = jsonMap["beer_description"],
        beerStyle = jsonMap["beer_style"],
        rating = jsonMap["rating_score"],
        breweryName = jsonMap["brewery_name"],
        breweryCity = jsonMap["brewery_city"],
        breweryState = jsonMap["brewery_State"];
}