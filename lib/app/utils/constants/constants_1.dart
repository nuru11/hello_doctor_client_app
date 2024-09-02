const appName = 'Hallo Doctor';

///This is only currency sign, any currency sign in this app will change to this,
///this is not going to change the real currency, you need to change it in the cloud function
const currencySign = '\ETB';

///this is for notification icon file name
/// you can change the notification icon in folder android/app/main/res/drawable/notification_icon.png,
/// make sure the icon is 8 bit color and transparent background
/// otherwise the notification icon will be full white
const notificationIconName = 'notification_icon';

/// Paymobconstants, if you dont use paymob payment gateway just ignore this constant
/// this will be use to check if the payment in paymob is success
const String paymobRedirectUrl =
    'https://us-central1-mylessionapp.cloudfunctions.net/paymobPaymentSuccessHTTPMessage';
