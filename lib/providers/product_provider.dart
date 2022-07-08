import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_user/db/db_helper.dart';
import 'package:ecommerce_user/models/product_model.dart';
import 'package:flutter/foundation.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> productList = [];
  List<String> categoryList = [];


  void getAllProducts() {
    DBHelper.fetchAllProducts().listen((event) {
      productList = List.generate(event.docs.length, (index) => ProductModel.fromMap(event.docs[index].data()));
      notifyListeners();
    });
  }

  void getAllProductsByCategory(String category) {
    DBHelper.fetchAllProductsByCategory(category).listen((event) {
      productList = List.generate(event.docs.length, (index) => ProductModel.fromMap(event.docs[index].data()));
      notifyListeners();
    });
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getProductByProductId(String productId) {
    return DBHelper.fetchProductByProductId(productId);
  }

  void getAllCategories() {
    DBHelper.fetchAllCategories().listen((event) {
      categoryList = List.generate(event.docs.length, (index) => event.docs[index].data()['name']);
      notifyListeners();
    });
  }
}