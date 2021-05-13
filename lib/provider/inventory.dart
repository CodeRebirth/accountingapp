import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InvProducts extends ChangeNotifier{

late String authtoken;

set auth(token){
this.authtoken = token;
notifyListeners();
}

var items = [];
var fetch;

Future<void> getAll() async{
 var url = Uri.parse("https://accountingapp-a68b2-default-rtdb.firebaseio.com/inventory.json?auth=$authtoken");
  var temp=[];
  try{
    var response = await http.get(url);
    var extracted = json.decode(response.body) as List ;
    extracted.forEach((element) { 
     temp.add(InvProduct(element["id"].toString(),element["name"].toString(),element["qty"].toString(),element["price"].toString()));
    });
    items=temp;
    }catch(e){
    print(e);
  }
}
Future<void> matchProduct(id) async{
var url = Uri.parse("https://accountingapp-a68b2-default-rtdb.firebaseio.com/inventory.json?auth=$authtoken");
var temp=[];
if(id==null) {
  return;
}
else{
var response =await http.get(url);
var extracted = json.decode(response.body) as List ;
extracted.forEach((element) { 
     temp.add(InvProduct(element["id"].toString(),element["name"].toString(),element["qty"].toString(),element["price"].toString()));
    });
temp.forEach((element){
  if(element.id == id){
    fetch = InvProduct(element.id,element.name,element.qty,element.price);
    temp=[];
    return ;
  }
});
}}

get getItems{
  return [...items];
}
get fetchItem{
  return fetch;
}

}


class InvProduct {
  late String id;
  late String name;
  late String qty;
  late String price;

  InvProduct(this.id, this.name, this.qty, this.price);
}