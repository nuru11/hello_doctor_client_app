import 'package:get/get.dart';

import '../modules/appointment/bindings/appointment_binding.dart';
import '../modules/appointment/views/appointment_view.dart';
import '../modules/appointment_detail/bindings/appointment_detail_binding.dart';
import '../modules/appointment_detail/views/appointment_detail_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/consultation_confirm/bindings/consultation_confirm_binding.dart';
import '../modules/consultation_confirm/views/consultation_confirm_view.dart';
import '../modules/consultation_date_picker/bindings/consultation_date_picker_binding.dart';
import '../modules/consultation_date_picker/views/consultation_date_picker_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/delete_account/bindings/delete_account_binding.dart';
import '../modules/delete_account/views/delete_account_view.dart';
import '../modules/detail_doctor/bindings/detail_doctor_binding.dart';
import '../modules/detail_doctor/views/detail_doctor_view.dart';
import '../modules/detail_order/bindings/detail_order_binding.dart';
import '../modules/detail_order/views/detail_order_view.dart';
import '../modules/detail_transaction_wallet/bindings/detail_transaction_wallet_binding.dart';
import '../modules/detail_transaction_wallet/views/detail_transaction_wallet_view.dart';
import '../modules/detail_wallet_history/bindings/detail_wallet_history_binding.dart';
import '../modules/detail_wallet_history/views/detail_wallet_history_view.dart';
import '../modules/doctor_category/bindings/doctor_category_binding.dart';
import '../modules/doctor_category/views/doctor_category_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list_chat/bindings/list_chat_binding.dart';
import '../modules/list_chat/views/list_chat_view.dart';
import '../modules/list_doctor/bindings/list_doctor_binding.dart';
import '../modules/list_doctor/views/list_doctor_view.dart';
import '../modules/list_prescription/bindings/list_prescription_binding.dart';
import '../modules/list_prescription/views/list_prescription_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/payment_success/bindings/payment_success_binding.dart';
import '../modules/payment_success/views/payment_success_view.dart';
import '../modules/paymobCardPayment/bindings/paymob_card_payment_binding.dart';
import '../modules/paymobCardPayment/views/paymob_card_payment_view.dart';
import '../modules/paymobKioskPayment/bindings/paymob_kiosk_payment_binding.dart';
import '../modules/paymobKioskPayment/views/paymob_kiosk_payment_view.dart';
import '../modules/prescription/bindings/prescription_binding.dart';
import '../modules/prescription/views/prescription_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/review/bindings/review_binding.dart';
import '../modules/review/views/review_view.dart';
import '../modules/search_doctor/bindings/search_doctor_binding.dart';
import '../modules/search_doctor/views/search_doctor_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/success_topup/bindings/success_topup_binding.dart';
import '../modules/success_topup/views/success_topup_view.dart';
import '../modules/top_rated_doctor/bindings/top_rated_doctor_binding.dart';
import '../modules/top_rated_doctor/views/top_rated_doctor_view.dart';
import '../modules/topup_wallet/bindings/topup_wallet_binding.dart';
import '../modules/topup_wallet/views/topup_wallet_view.dart';
import '../modules/user_wallet/bindings/user_wallet_binding.dart';
import '../modules/user_wallet/views/user_wallet_view.dart';
import '../modules/video_call/bindings/video_call_binding.dart';
import '../modules/video_call/views/video_call_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const DASHBOARD = Routes.DASHBOARD;
  static const LOGIN = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_CATEGORY,
      page: () => DoctorCategoryView(),
      binding: DoctorCategoryBinding(),
    ),
    GetPage(
      name: _Paths.LIST_DOCTOR,
      page: () => ListDoctorView(),
      binding: ListDoctorBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_DOCTOR,
      page: () => DetailDoctorView(),
      binding: DetailDoctorBinding(),
    ),
    GetPage(
      name: _Paths.CONSULTATION_DATE_PICKER,
      page: () => ConsultationDatePickerView(),
      binding: ConsultationDatePickerBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ORDER,
      page: () => DetailOrderView(),
      binding: DetailOrderBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_SUCCESS,
      page: () => PaymentSuccessView(),
      binding: PaymentSuccessBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_CALL,
      page: () => VideoCallView(),
      binding: VideoCallBinding(),
    ),
    GetPage(
      name: _Paths.APPOINTMENT,
      page: () => AppointmentView(),
      binding: AppointmentBinding(),
    ),
    GetPage(
      name: _Paths.APPOINTMENT_DETAIL,
      page: () => AppointmentDetailView(),
      binding: AppointmentDetailBinding(),
    ),
    GetPage(
      name: _Paths.REVIEW,
      page: () => ReviewView(),
      binding: ReviewBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.TOP_RATED_DOCTOR,
      page: () => TopRatedDoctorView(),
      binding: TopRatedDoctorBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_DOCTOR,
      page: () => SearchDoctorView(),
      binding: SearchDoctorBinding(),
    ),
    GetPage(
      name: _Paths.CONSULTATION_CONFIRM,
      page: () => ConsultationConfirmView(),
      binding: ConsultationConfirmBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.LIST_CHAT,
      page: () => ListChatView(),
      binding: ListChatBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.DELETE_ACCOUNT,
      page: () => const DeleteAccountView(),
      binding: DeleteAccountBinding(),
    ),
    GetPage(
      name: _Paths.PRESCRIPTION,
      page: () => const PrescriptionView(),
      binding: PrescriptionBinding(),
    ),
    GetPage(
      name: _Paths.LIST_PRESCRIPTION,
      page: () => const ListPrescriptionView(),
      binding: ListPrescriptionBinding(),
    ),
    GetPage(
      name: _Paths.PAYMOB_CARD_PAYMENT,
      page: () => const PaymobCardPaymentView(),
      binding: PaymobCardPaymentBinding(),
    ),
    GetPage(
      name: _Paths.PAYMOB_KIOSK_PAYMENT,
      page: () => const PaymobKioskPaymentView(),
      binding: PaymobKioskPaymentBinding(),
    ),
    GetPage(
      name: _Paths.USER_WALLET,
      page: () => const UserWalletView(),
      binding: UserWalletBinding(),
    ),
    GetPage(
      name: _Paths.TOPUP_WALLET,
      page: () => const TopupWalletView(),
      binding: TopupWalletBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS_TOPUP,
      page: () => const SuccessTopupView(),
      binding: SuccessTopupBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TRANSACTION_WALLET,
      page: () => const DetailTransactionWalletView(),
      binding: DetailTransactionWalletBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_WALLET_HISTORY,
      page: () => const DetailWalletHistoryView(),
      binding: DetailWalletHistoryBinding(),
    ),
  ];
}
