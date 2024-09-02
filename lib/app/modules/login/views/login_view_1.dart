import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:hallo_doctor_client/app/modules/login/views/widgets/divider_or.dart';
import 'package:hallo_doctor_client/app/modules/login/views/widgets/label_button.dart';
import 'package:hallo_doctor_client/app/modules/login/views/widgets/title_app.dart';
import 'package:hallo_doctor_client/app/modules/widgets/submit_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    final node = FocusScope.of(context);
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 
                  SizedBox(height: height * .2),
                  TitleApp(),
                  SizedBox(height: 50),
                  FormBuilder(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: controller.loginFormKey,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          key: Key('username'),
                          name: 'username',
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () {
                            node.nextFocus();
                          },
                          validator: FormBuilderValidators.email(),
                          decoration: InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  )),
                              fillColor: Colors.grey[200],
                              filled: true),
                        ),
                        SizedBox(height: 30),
                        GetBuilder<LoginController>(
                          builder: (cont) => FormBuilderTextField(
                            key: Key('password'),
                            obscureText: controller.passwordVisible,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    )),
                                fillColor: Colors.grey[200],
                                filled: true,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      controller.passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.blue[300]),
                                  onPressed: () {
                                    controller.passwordIconVisibility();
                                  },
                                )),
                            name: 'password',
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    key: Key('forgotPasswordButton'),
                    onTap: () {
                      Get.toNamed('/forgot-password');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password ?'.tr,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(height: height * .020),
                  SubmitButton(
                      key: Key('loginButton'),
                      onTap: () {
                        controller.login();
                      },
                      text: 'Login'.tr),
                  SizedBox(
                    height: 10,
                  ),
                  DividerOr(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: Get.width,
                    height: 50,
                    child: SignInButton(
                      Buttons.Google,
                      onPressed: () {
                        controller.loginGoogle();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defaultTargetPlatform == TargetPlatform.iOS
                      ? Container(
                          width: Get.width,
                          height: 50,
                          child: SignInButton(
                            Buttons.AppleDark,
                            onPressed: () {
                              controller.loginApple();
                            },
                          ),
                        )
                      : Container(),
                  SizedBox(height: 20),
                  LabelButton(
                    onTap: () {
                      Get.toNamed('/register');
                    },
                    title: 'Don\'t have an account, '.tr,
                    subTitle: 'Register'.tr,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
