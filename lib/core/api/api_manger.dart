import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'end_points.dart';

part 'api_manger.g.dart';

@injectable
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class NewApiManger {
  @factoryMethod
  factory NewApiManger(Dio dio) = _NewApiManger;
}


///////////////////////////////////Example of How Will Work With Retrofit/////////////////////
/////////////////////////// in Repo take object of NewApiManger and get the method you want/////////////////////
// @injectable
// @RestApi(baseUrl: EndPoints.baseUrl)
// abstract class NewApiManger {
//   @factoryMethod
//   factory NewApiManger(Dio dio) = _NewApiManger;
//
// ///////////////Home/////////////////////
//   @GET(EndPoints.getAllCategory)
//   Future<CategoryModel> getAllCategory();
//
//   @GET(EndPoints.getAllBrand)
//   Future<BrandModel> getAllBrand();
// /////////////category/////////////////////
//   @GET(EndPoints.getProductBaseOnCategory)
//   Future<ProductModel> getProductBaseOnCategory(@Path() String categoryId);
//   @GET(EndPoints.getProductBaseOnCategory)
//   Future<SubCategoryModel> getProductBaseOnCategoryForCategory(@Path() String categoryId);
//
// ///////////////cart/////////////////////
//   @GET(EndPoints.getCartProduct)
//   Future<CartProductsModel> getCartProduct();
//
//   @POST(EndPoints.addToCart)
//   Future<void> addToCart(@Body() Map<String, dynamic> body);
//
//   @DELETE(EndPoints.deleteFromCart)
//   Future<void> deleteFromCart(@Path() String productId);
//   ///////////wishlist/////////////////////
//   @GET(EndPoints.getWishlistData)
//   Future<WishlistProductModel> getWishlistData();
//   @POST(EndPoints.addToWishList)
//   Future<void> addToWishList(@Body() Map<String, dynamic> body);
//   @DELETE(EndPoints.deleteFromWishList)
//   Future<void> deleteFromWishList(@Path() String productId);
// /////////////// auth/////////////////////
//   @POST(EndPoints.logIn)
//   Future<UserModel> signIn(@Body() Map<String, dynamic> body);
//   @POST(EndPoints.signUp)
//   Future<UserModel> signUp(@Body()SignUserModel signUserModel);
// }