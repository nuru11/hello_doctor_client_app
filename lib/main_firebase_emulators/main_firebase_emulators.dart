import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hallo_doctor_client/app/service/firebase_service.dart';
import 'package:hallo_doctor_client/app/service/local_notification_service.dart';
import 'package:hallo_doctor_client/app/utils/environment.dart';
import 'package:hallo_doctor_client/main.dart';
import 'package:intl/date_symbol_data_local.dart';

/// this main file is used to run the app in firebase cloud emulator,
/// firebase cloud emulator is firebase server but running on local machine
/// this is used for testing the app, if you wanto run this open run tab in vs code and choose firebase cloud emulator
/// then run the app, but make sure you alredy run the firebase cloud emulator in your local machine
/// refer to https://firebase.google.com/docs/functions/local-emulator
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp();
  FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
  FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
  LocalNotificationService().initNotification();
  bool isUserLogin = await FirebaseService().checkUserAlreadyLogin();
  Stripe.publishableKey = Environment.stripePublishableKey;
  initializeDateFormatting('en', null);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  FirebaseChatCore.instance
      .setConfig(FirebaseChatCoreConfig(null, 'Rooms', 'Users'));
  runApp(HalloDoctorApp(isUserLogin: isUserLogin));
}
