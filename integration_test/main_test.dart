import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hallo_doctor_client/app/service/notification_service.dart';
import 'package:hallo_doctor_client/app/utils/environment.dart';
import 'package:hallo_doctor_client/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:patrol/patrol.dart';

///Integration Test using Patrol Test, why using patroll instead of flutter integration test? because default flutter test doesn't
///support native test, like clicking on allow notification but with patroll you can do all of the native test
///for more information refer to patroll documentation https://patrol.leancode.co/
///These test are just example test just to make sure the app is working, you are open to create your own test
///To run the test using patrol use this command, but make sure you have install the patroll cli, follow the documentation https://patrol.leancode.co/
///Command : patrol test -t integration_test/main_test.dart
void main() {
  //Replace these values with your own
  String email = 'test11@gmail.com';
  String password = 'test11';
  setUp(() async {
    await dotenv.load();
    await Firebase.initializeApp();
    NotificationService();
    Stripe.publishableKey = Environment.stripePublishableKey;
    initializeDateFormatting('en', null);
    FirebaseChatCore.instance
        .setConfig(FirebaseChatCoreConfig(null, 'Rooms', 'Users'));
  });

  patrolTest('Login Test', ($) async {
    await $.pumpWidgetAndSettle(HalloDoctorApp(isUserLogin: false));
    await $(#username).enterText(email);
    await $(#password).enterText(password);
    await $.tester.testTextInput.receiveAction(TextInputAction.done);
    await $(#loginButton).tap(settlePolicy: SettlePolicy.noSettle);
    await $("Welcome Back,").waitUntilExists();
    if (await $.native
        .isPermissionDialogVisible(timeout: Duration(seconds: 10))) {
      // await $.native.grantPermissionWhenInUse();
      print('notification permission pop up');
      await $.native.tap(
        Selector(text: 'Allow'),
      );
    }

    /// click on bottom navigation bar to go
    await $(#doctorCategoryIcon).tap();
    await $(#appointmentIcon).tap();
    await $(#chatIcon).tap();
    await $(#profileIcon).tap();
  });
}
