// ignore_for_file: constant_identifier_names
part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const MAIN = _Paths.MAIN;
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const EQUIPMENT = _Paths.EQUIPMENT;
  static const PROCEDURE = _Paths.PROCEDURE;
  static const CONTACT = _Paths.CONTACT;
  static const SEARCH = _Paths.SEARCH;
  static const CHECKOUT = _Paths.CHECKOUT;
  static const PROFILE = _Paths.PROFILE;
  static const SIGNIN = _Paths.SIGNIN;
  static const SIGNUP = _Paths.SIGNUP;
  static const FORGOT = _Paths.FORGOT;
  static const FORGOTOPT = _Paths.FORGOTOPT;
  static const NEWPASSWORD = _Paths.NEWPASSWORD;
  static const CART = _Paths.CART;
  static const ADDRESS = _Paths.ADDRESS;
  static const CARD = _Paths.CARD;
  static const ADDCARD = _Paths.ADDCARD;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const MAIN = '/main';
  static const HOME = '/home';
  static const EQUIPMENT = '/equipment';
  static const PROCEDURE = '/procedure';
  static const CONTACT = '/contact';
  static const SEARCH = '/search';
  static const CHECKOUT = '/checkout';
  static const CART = '/cart';
  static const PROFILE = '/profile';
  static const SIGNIN = '/signin';
  static const SIGNUP = '/signup';
  static const FORGOT = '/forgot';
  static const FORGOTOPT = '/forgot-opt';
  static const NEWPASSWORD = '/newpassword';
  static const ADDRESS = '/address';
  static const CARD = '/card';
  static const ADDCARD = '/addcard';
}
