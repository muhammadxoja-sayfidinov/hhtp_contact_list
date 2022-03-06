class Person{
  String? name;
  String? phoneNUmber;
  String? imageUrl;

  Person({this.name, this.imageUrl, this.phoneNUmber});

  Person.fromJson(Map<String, dynamic> json):
        name = "${json['name']['title']} ${json['name']['first']} ${json['name']['last']}",
  phoneNUmber = json['phone'],
  imageUrl = json['picture']['thumbnail'];

}