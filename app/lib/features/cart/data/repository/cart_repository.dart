import 'package:diyar_express/features/cart/data/models/models.dart';

import '../datasources/cart_remote_data_source.dart';

abstract class CartRepository {
  // CARTS
  Future<void> addToCart(CartItemModel product);
  Future<void> removeFromCart(String id);
  Future<void> incrementCart(String id);
  Future<void> decrementCart(String id);
  Stream<List<CartItemModel>> getAllCartItems();
}

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;

  CartRepositoryImpl(this._cartRemoteDataSource);

  @override
  Future<void> addToCart(CartItemModel product) {
    return _cartRemoteDataSource.addToCart(product);
  }

  @override
  Future<void> decrementCart(String id) {
    return _cartRemoteDataSource.decrementCart(id);
  }

  @override
  Future<void> incrementCart(String id) {
    return _cartRemoteDataSource.incrementCart(id);
  }

  @override
  Future<void> removeFromCart(String id) {
    return _cartRemoteDataSource.removeFromCart(id);
  }

  @override
  Stream<List<CartItemModel>> getAllCartItems() {
    return _cartRemoteDataSource.getAllCartItems();
  }
}
