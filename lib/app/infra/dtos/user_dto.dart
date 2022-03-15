// ignore_for_file: overridden_fields, annotate_overrides

import 'package:ecommerce/app/domain/entities/product_entity.dart';
import 'package:ecommerce/app/domain/entities/user_entity.dart';

class UserDTO extends UserEntity {
  final String name;
  final String email;
  final List<ProductEntity> cartItems;

  UserDTO({required this.name, required this.email, required this.cartItems})
      : super(name: name, email: email, cartItems: cartItems);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'cartItems': cartItems,
    };
  }

  factory UserDTO.fromMap(Map<String, dynamic>? map) {
    return UserDTO(
      name: map?['name'] ?? '',
      email: map?['email'] ?? '',
      cartItems:
          List<ProductEntity>.from(map?['cartItems'] ?? <ProductEntity>[]),
    );
  }
}
