import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier{
late String authtoken;
List<Product> products = [];
List<Product> fetchItems = [];
List keys=[];

set auth(token){
this.authtoken = token;
notifyListeners();
}

static const url = "https://accountingapp-a68b2-default-rtdb.firebaseio.com/products.json";
var uri = Uri.parse(url);

void addProduct(value){
    products.add(value);
    notifyListeners();
  }

Future<void> saved() async{
try{
  await http.post(uri,body:json.encode(
    {
      "bills":products.map((value) =>{
        "name":value.name,
        "price":value.price
      }).toList()
    }
  ));
}catch(err){
print(err);
}
}

Future<void>getProducts() async{
var url = Uri.parse("https://accountingapp-a68b2-default-rtdb.firebaseio.com/products.json?auth=$authtoken");
var tempKey = [];
try{
var response = await http.get(url);
var extracted = json.decode(response.body)as Map<String,dynamic> ;
extracted.forEach((key,value){
tempKey.add(key);
});
keys=tempKey;
}catch(err){
  print(err);
}
}

Future<void> getitem(id) async{
  var url = Uri.parse("https://accountingapp-a68b2-default-rtdb.firebaseio.com/products/$id.json?auth=$authtoken");
  List<Product> items = [];
  try{
    var response = await http.get(url);
    var extracted = json.decode(response.body) as Map<String,dynamic>;
    for (var i in extracted['bills'] as List){
      items.add(Product(i["name"],i["price"]));
    }
    fetchItems=items;
  }catch(err){
    print(err);
  }
}

//delete
void delete(int value){
  products.removeAt(value);
  notifyListeners();
}
//get keys
get getkeys{
  return [...keys];
}
get fetchItem{
return [...fetchItems];
}
//getter
get prod{
  return [...products];
}
}


class Product{
String name;
String price;
Product(this.name,  this.price);
}

