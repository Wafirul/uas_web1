import 'package:shop/data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> fetch();
}
