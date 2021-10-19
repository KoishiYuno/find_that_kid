class Location {
  final double lat;
  final double lng;
  final int date;
  final String state;
  final String place;

  Location(
      {required this.state,
      required this.lat,
      required this.lng,
      required this.date,
      required this.place});

  factory Location.fromJson(Map<dynamic, dynamic> json) => Location(
        lat: json['lat'] as double,
        lng: json['lng'] as double,
        date: json['date'] as int,
        state: json['state'] as String,
        place: json['place'] as String,
      );

  Map toJson() => {
        'lat': lat,
        'lng': lng,
        'date': date,
        'state': state,
        'place': place,
      };
}
