class ApiConst {
  ApiConst._();

  // AUTH
  static const signUp = "auth/sign-up";
  static const signIn = "auth/sign-in";
  static const refreshToken = "auth/refresh-token";
  static const resetPsw = "auth/reset-password";
  static const sendCodeToEmail = "auth/send-code-to-email";

  // USER
  static const getUser = "user/get-user-info/";
  static const updateEmail = "user/update-email/";
  static const codeForUpdateEmail = "user/send-code-for-update-email/";
  static const updateUserName = "user/update-username/";
  static const updateUserPhone = "user/update-user-phone/";
  static const deleteUser = "user/delete-user/";

  // CATEGORIES
  static const getCategories = "categorys/get-all-category-with-foods/";
  static const getCountFoddsByCategory = "categorys/get-quantity-foods-by-category/";
}
