const _urlBase = "https://66768690145714a1bd71ff9d.mockapi.io";
const _urlLocal = "http://10.0.2.2:3000/api/v1";
mixin class ApiUrl {

  static const loginLocal = "$_urlLocal/auth/login";
  static const getProducts = "$_urlBase/product";
  static const getMyCart = "$_urlBase/cart";
  static const updateCart = "$_urlBase/cart";
}
