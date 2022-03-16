import 'package:ecommerce/app/domain/entities/product_entity.dart';
import 'package:ecommerce/app/domain/repositories/cart_repository.dart';
import 'package:ecommerce/app/infra/datasources/user_datasource.dart';
import 'package:ecommerce/app/infra/dtos/product_dto.dart';

class CartRepositoryImp implements CartRepository {
  final UserDatasource _userDatasource;

  CartRepositoryImp(this._userDatasource);

  @override
  Future<List<ProductEntity>> getCartProducts() async {
    final fireStoreCartList = await _userDatasource.getCartItems();

    return fireStoreCartList
        .map((product) => ProductDTO.fromMap(product))
        .toList();
  }

  @override
  Future<double> getCartTotalValue() async {
    final cartProductList = await getCartProducts();
    double total = 0.0;

    for (var product in cartProductList) {
      total += product.value;
    }

    return total;
  }

  @override
  Future<void> addCartItem(ProductEntity product) async {
    final productJson = ProductDTO(
      name: product.name,
      value: product.value,
      imgUrls: product.imgUrls,
      tag: product.tag,
      size: product.size,
    );

    return await _userDatasource.addCartItem(productJson.toMap());
  }

  @override
  Future<void> deleteCartItem(ProductEntity product) async {
    final productJson = ProductDTO(
      name: product.name,
      value: product.value,
      imgUrls: product.imgUrls,
      tag: product.tag,
      size: product.size,
    );

    return await _userDatasource.deleteCartItem(productJson.toMap());
  }
}
