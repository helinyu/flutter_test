// class Person {
//   String name;
//   int age;
//   double height;

//   Person({this.name, this.age, this.height});

//   factory Person.fromJson(Map<String, dynamic> json) {
//     return Person(name: json['name'], age: json['age'], height: json['height']);
//   }
// }

class Person {
  String firstName;
  String lastName;
  String email;

  Person({this.firstName, this.lastName, this.email});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(firstName: json['firstName'], lastName: json['lastName'], email: json['email']);
  }
}
