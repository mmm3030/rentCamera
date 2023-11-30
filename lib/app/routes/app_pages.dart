import 'package:get/get.dart';
import 'package:rent_camera/app/modules/add_credit_card/add_card_binding.dart';
import 'package:rent_camera/app/modules/add_credit_card/add_card_view.dart';
import 'package:rent_camera/app/modules/address/address_binding.dart';
import 'package:rent_camera/app/modules/address/address_view.dart';
import 'package:rent_camera/app/modules/card/card_binding.dart';
import 'package:rent_camera/app/modules/card/card_view.dart';
import 'package:rent_camera/app/modules/cart/cart_binding.dart';
import 'package:rent_camera/app/modules/cart/cart_view.dart';
import 'package:rent_camera/app/modules/checkout/checkout_binding.dart';
import 'package:rent_camera/app/modules/checkout/checkout_view.dart';
import 'package:rent_camera/app/modules/contact/contact_binding.dart';
import 'package:rent_camera/app/modules/contact/contact_view.dart';
import 'package:rent_camera/app/modules/equipment/equipment_binding.dart';
import 'package:rent_camera/app/modules/equipment/equipment_view.dart';
import 'package:rent_camera/app/modules/forgotPassword/forgot_binding.dart';
import 'package:rent_camera/app/modules/forgotPassword/forgot_view.dart';
import 'package:rent_camera/app/modules/forgotPassword_opt/forgotPassOpt_binding.dart';
import 'package:rent_camera/app/modules/forgotPassword_opt/forgotPassOpt_view.dart';
import 'package:rent_camera/app/modules/history/history_binding.dart';
import 'package:rent_camera/app/modules/history/history_view.dart';
import 'package:rent_camera/app/modules/home/home_binding.dart';
import 'package:rent_camera/app/modules/home/home_view.dart';
import 'package:rent_camera/app/modules/login/login_binding.dart';
import 'package:rent_camera/app/modules/login/login_view.dart';
import 'package:rent_camera/app/modules/main/main_binding.dart';
import 'package:rent_camera/app/modules/main/main_view.dart';
import 'package:rent_camera/app/modules/newPassword/newPassword_binding.dart';
import 'package:rent_camera/app/modules/newPassword/newPassword_view.dart';
import 'package:rent_camera/app/modules/procedure/procedure_binding.dart';
import 'package:rent_camera/app/modules/procedure/procedure_view.dart';
import 'package:rent_camera/app/modules/profile/profile_binding.dart';
import 'package:rent_camera/app/modules/profile/profile_view.dart';
import 'package:rent_camera/app/modules/search/search_binding.dart';
import 'package:rent_camera/app/modules/search/search_view.dart';
import 'package:rent_camera/app/modules/signIn/signIn_binding.dart';
import 'package:rent_camera/app/modules/signIn/signIn_view.dart';
import 'package:rent_camera/app/modules/signUp/signUp_binding.dart';
import 'package:rent_camera/app/modules/signUp/signUp_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.EQUIPMENT,
      page: () => const EquipmentView(),
      binding: EquipmentBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.PROCEDURE,
      page: () => const ProcedureView(),
      binding: ProcedureBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CONTACT,
      page: () => const ContactView(),
      binding: ContactBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SignInView(),
      binding: SignInBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.FORGOT,
      page: () => const ForgotPasswordView(),
      binding: ForgotBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.FORGOTOPT,
      page: () => const ForgotPasswordOptView(),
      binding: ForgotOptBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.NEWPASSWORD,
      page: () => const NewPasswordView(),
      binding: NewPasswordBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: _Paths.ADDRESS,
      page: () => const AddressView(),
      binding: AddressBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: _Paths.CARD,
      page: () => const CardView(),
      binding: CardBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.ADDCARD,
      page: () => const AddCardView(),
      binding: AddCardBinding(),
      transition: Transition.noTransition,
    ),
       GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
      transition: Transition.noTransition,
    ),
  ];
}
