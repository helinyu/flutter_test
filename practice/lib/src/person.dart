class Person {
  String firstName;
  String lastName;
  String email;

  Person({this.firstName, this.lastName, this.email});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(firstName: json['firstName'], lastName: json['lastName'], email: json['email']);
  }
}
