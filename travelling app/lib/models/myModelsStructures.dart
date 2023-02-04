class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    required  this.imageUrl,
    required  this.name,
    required  this.address,
    required  this.price,
  });
}


class Activity {
  String imageUrl;
  String name;
  String type;
  List<String> startTimes;
  int rating;
  int price;

  Activity({
    required  this.imageUrl,
    required  this.name,
    required  this.type,
    required  this.startTimes,
    required  this.rating,
    required  this.price,
  });
}

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    required this.activities,
  });
}
