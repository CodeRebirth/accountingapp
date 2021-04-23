import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier{
List<Product> products = [];
List keys=[];
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
var tempKey = [];
try{
var response = await http.get(uri);
var extracted = json.decode(response.body)as Map<String,dynamic> ;
extracted.forEach((key,value){
tempKey.add(key);
});
keys=tempKey;
}catch(err){
  print(err);
}
}

//delete
void delete(int value){
  products.removeAt(value);
  notifyListeners();
}
get getkeys{
  return [...keys];
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

