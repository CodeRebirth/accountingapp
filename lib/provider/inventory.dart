import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InvProducts extends ChangeNotifier{

static const url = "https://accountingapp-a68b2-default-rtdb.firebaseio.com/inventory.json";
var uri = Uri.parse(url);
var items = [];

Future<void> getAll() async{
  var temp=[];
  try{
    var response = await http.get(uri);
    var extracted = json.decode(response.body) as List ;
    extracted.forEach((element) { 
     temp.add(InvProduct(element["id"].toString(),element["name"].toString(),element["qty"].toString(),element["price"].toString()));
    });
    items=temp;
    }catch(e){
    print(e);
  }
}

get getItems{
  return [...items];
}

}


class InvProduct {
  late String id;
  late String name;
  late String qty;
  late String price;

  InvProduct(this.id, this.name, this.qty, this.price);
}