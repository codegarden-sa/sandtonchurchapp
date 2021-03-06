import 'package:flutter/material.dart';

class User {
  final String uid;

  User({this.uid});
}

class UserDetails with ChangeNotifier {
  final String uid;
  final String name;
  final String surname;
  final String cellNumber;
  final String email;
  final String status;

  UserDetails({this.uid, this.name, this.surname, this.cellNumber, this.email, this.status});


}
