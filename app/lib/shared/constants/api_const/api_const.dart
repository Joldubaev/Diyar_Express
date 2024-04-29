class ApiConst {
  ApiConst._();

  // AUTH
  static const signUp = "http://20.55.72.226:8080/auth/sign-up";
  static const signIn = "http://20.55.72.226:8080/auth/sign-in";
  static const refreshToken = "http://20.55.72.226:8080/auth/refresh-token";
  static const resetPsw = "http://20.55.72.226:8080/auth/reset-password";
  static const sendCodeToEmail = "http://20.55.72.226:8080/auth/send-code-to-email";

  // USER
  static const getUser = "http://20.55.72.226:8080/user/get-user-info";
  static const updateEmail = "http://20.55.72.226:8080/user/update-email";
  static const codeForUpdateEmail = "http://20.55.72.226:8080/user/send-code-for-update-email";
  static const updateUser = "http://20.55.72.226:8080/user/update-user";
  static const deleteUser = "http://20.55.72.226:8080/user/delete-user";

  // CATEGORIES
  static const getCategories = "http://20.55.72.226:8080/categorys/get-all-category-with-foods/";
  static const getCountFoddsByCategory = "http://20.55.72.226:8080/categorys/get-quantity-foods-by-category/";
  static const searchFoodsByName = 'http://20.55.72.226:8080/foods/get-food-by-name/';

  // Map
  static String getLocations({
    required String apiKey,
    required String lat,
    required String lang,
  }) =>
      "https://geocode-maps.yandex.ru/1.x/?$apiKey&geocode=$lat,$lang&format=json";

  static String getLocationByAdress({
    required String apiKey,
    required String lat,
    required String lang,
  }) =>
      "https://geocode-maps.yandex.ru/1.x/?apikey=$apiKey&geocode=$lat,$lang&format=json";

  static Map<String, String> authMap(String token) => {'Authorization': 'Bearer $token'};
  static const updateUserName = "http://20.55.72.226:8080/user/update-username";
  static const updateUserPhone = "http://20.55.72.226:8080/user/update-user-phone";
}
