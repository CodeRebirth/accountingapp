import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth extends ChangeNotifier{

String? _token; 
DateTime? _expires;
late String _userId;

bool get isAuth {
return token !=  null;
}

get userId{
  if(isAuth)
  return _userId;
}

get token{
if (_expires !=null && _expires!.isAfter(DateTime.now()) && _token != null){
  return _token;
}
return null;
}

Future<void> authenticate(email, password, urlcatch) async{

final url = "https://identitytoolkit.googleapis.com/v1/accounts:$urlcatch?key=AIzaSyA6yl0rtDuvKvZs5HK5Cr8SGEAeFNTvxJ4";
final uri = Uri.parse(url);
try{
var response = await http.post(uri,body:json.encode({
    "email": email,
    "password": password,
    "returnSecureToken":true
    }));
final data = json.decode(response.body);
      _token =data["idToken"];
      _userId = data["localId"];
      _expires=DateTime.now().add(Duration(seconds: int.parse(data["expiresIn"])));
      notifyListeners();
}catch(e){
print("error");
}
}

Future<void> signup(email,password) async{
return authenticate(email,password,"signUp");
}

Future<void> login(email,password) async {
return authenticate(email,password,"signInWithPassword");
}
}
