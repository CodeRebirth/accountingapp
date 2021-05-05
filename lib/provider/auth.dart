import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth extends ChangeNotifier{

String? _token; 
DateTime? _expires;
// late String _userId;

bool get isAuth {
return token !=  null;
}

get token{
// ignore: unnecessary_null_comparison
if (_expires !=null && _expires!.isAfter(DateTime.now()) && _token != null){
  return _token;
}
return null;
}

Future<void> signup(email,password) async{
const url = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA6yl0rtDuvKvZs5HK5Cr8SGEAeFNTvxJ4";
final uri = Uri.parse(url);
try{
  var response = await http.post(uri,body: json.encode({
    "email": email,
    "password": password,
    "returnSecureToken":true
  }));
  print(response.body[0]);
}catch(e){
  print(e);
}
}

Future<void> login(email,password) async {

const url = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA6yl0rtDuvKvZs5HK5Cr8SGEAeFNTvxJ4";
final uri = Uri.parse(url);
try{
var response = await http.post(uri,body:json.encode({
    "email": email,
    "password": password,
    "returnSecureToken":true
    }));
final data = json.decode(response.body);
  _token =data["idToken"];
  _expires=DateTime.now().add(Duration(seconds: int.parse(data["expiresIn"])));
  notifyListeners();
}catch(e){
print(e);
}
}
}
