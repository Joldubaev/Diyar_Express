// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dio/dio.dart';
// import 'package:diyar_express/constants/app_const/app_const.dart';
// import 'package:diyar_express/core/core.dart';
// import 'package:diyar_express/features/cart/data/models/models.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// abstract class CartRemoteDataSource {
//   // CARTS
//   Future<void> addToCart(CartItemModel product, int productId);
//   Future<void> removeFromCart(int id);
//   Future<void> incrementCart(int id);
//   Future<void> decrementCart(int id);
//   Stream<List<CartItemModel>> getAllCartItems();
//   Future<void> sendOrder(
//     List<CartItemModel> carts, {
//     required String comment,
//     required int addressId,
//   });
// }

// class CartRemoteDataSourceImpl implements CartRemoteDataSource {
//   final _firestore = FirebaseFirestore.instance;
//   final SharedPreferences _prefs;
//   final Dio _dio;

//   CartRemoteDataSourceImpl(this._prefs, this._dio);

//   Future<void> createUser(String userId) async {
//     DocumentReference userRef = _firestore.collection('users').doc(userId);

//     await userRef.set({
//       'id': userId,
//       "name": JwtDecoder.decode(
//           _prefs.getString(AppConst.accessToken) ?? '')['fullname'],
//       'token': _prefs.getString(AppConst.accessToken),
//     });
//   }

//   @override
//   Future<void> addToCart(CartItemModel product, int productId) async {
//     var userId = _prefs.getInt(AppConst.userId);
//     await createUser("$userId");
//     await _firestore
//         .collection('users')
//         .doc('$userId')
//         .collection('cart')
//         .doc("$productId")
//         .set({
//       // product.toJson()
//     });
//   }

//   @override
//   Stream<List<CartItemModel>> getAllCartItems() {
//     var userId = _prefs.getInt(AppConst.userId);
//     return _firestore
//         .collection('users')
//         .doc("$userId")
//         .collection('cart')
//         .snapshots()
//         .map(
//             (snapshot) => snapshot.docs.map((doc) => CartItemModel()).toList());

//     // CartItemModel.fromJson(doc.data())
//   }

//   @override
//   Future<void> removeFromCart(int id) async {
//     var userId = _prefs.getInt(AppConst.userId);
//     _firestore
//         .collection('users')
//         .doc('$userId')
//         .collection('cart')
//         .doc("$id")
//         .delete();
//   }

//   @override
//   Future<void> decrementCart(int id) async {
//     var userId = _prefs.getInt(AppConst.userId);
//     var docRef = _firestore
//         .collection('users')
//         .doc('$userId')
//         .collection('cart')
//         .doc("$id");
//     await _firestore.runTransaction((transaction) async {
//       final docSnapshot = await transaction.get(docRef);

//       if (docSnapshot.exists) {
//         int newQuantity = docSnapshot.get('quantity') - 1;
//         transaction.update(docRef, {'quantity': newQuantity});
//       }
//     });
//   }

//   @override
//   Future<void> incrementCart(int id) async {
//     var userId = _prefs.getInt(AppConst.userId);
//     var docRef = _firestore
//         .collection('users')
//         .doc('$userId')
//         .collection('cart')
//         .doc("$id");
//     await _firestore.runTransaction((transaction) async {
//       final docSnapshot = await transaction.get(docRef);

//       if (docSnapshot.exists) {
//         int newQuantity = docSnapshot.get('quantity') + 1;
//         transaction.update(docRef, {'quantity': newQuantity});
//       }
//     });
//   }

//   @override
//   Future<void> sendOrder(
//     List<CartItemModel> carts, {
//     required String comment,
//     required int addressId,
//   }) async {
//     try {
//       // var user = _authLocalService.getUserFromCache();
//       var token = _prefs.getString(AppConst.accessToken);
//       var response = await _dio.post('https://givbox.ru/givbox/core/order/',
//           options: Options(headers: {"Authorization": "Bearer $token"}),
//           data: {
//             "items": carts
//                 .map((e) => {
//                       // "item": e.item?.id,
//                       // "quantity": e.quantity,
//                     })
//                 .toList(),
//             "store": 0,
// /*             "totalCost": carts.fold(
//                 0,
//                 (total, item) =>
//                     total + (item.quantity * (item.item?.cost?.toInt() ?? 1))), */
//             "addresses": addressId,
//             // "phone": user?.phone,
//             "lat": 0,
//             "lon": 0,
//             "comment": comment,
//             "status": "new",
//             "isoptovik": false,
//             "bonus": 0,
//             "pay_status": false,
//             "client": _prefs.getInt(AppConst.userId)
//           });
//       if (![200, 201].contains(response.statusCode)) {
//         throw ServerException();
//       }
//     } catch (e) {
//       throw ServerException();
//     }
//   }
// }
