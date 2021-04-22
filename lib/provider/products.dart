import 'package:flutter/material.dart';
class Products with ChangeNotifier{
List<Product> products = [];

void addProduct(value){
  products.add(value);
  notifyListeners();
}

void delete(int value){
  products.removeAt(value);
  notifyListeners();
}

get prod{
  return [...products];
}

}

class Product{
String name;
String price;
Product(this.name,  this.price);
}

