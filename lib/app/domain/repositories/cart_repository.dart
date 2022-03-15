import 'package:ecommerce/app/domain/entities/product_entity.dart';

abstract class CartRepository {
  Future<List<ProductEntity>> getCartProducts();
  Future<void> addCartItem(ProductEntity product);
}
