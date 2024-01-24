import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../home/view/home.dart';
import '../component/coustom_textfield.dart';
import '../controller/signin_controller.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool? isCheck = false;
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: controller.formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/learning.png",
                  height: context.screenHeight * .22,
                  width: context.screenWidth * .60,
                ).box.alignCenter.make(),
                "Sign in to your account".text.size(28).make(),
                coustomtextfield(
                  controller: controller.emailController,
                  hint: "Enter your Email",
                  title: "Phone number or Email",
                  isPass: false,
                  validator: controller.validateemail,
                ),
                coustomtextfield(
                  controller: controller.passwordController,
                  hint: "********",
                  title: "Password",
                  isPass: true,
                  validator: controller.validpass,
                ),
                10.heightBox,
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      value: isCheck,
                      onChanged: (newvalue) {
                        setState(() {
                          isCheck = newvalue;
                        });
                      },
                    ),
                    "Remember me".text.make()
                  ],
                ),
                SizedBox(
                  width: context.screenWidth * .7,
                  height: 44,
                  child: Obx(
                    () => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF134668),
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () async {
                        await controller.loginUser(context);
                        if (controller.userCredential != null) {
                          Get.offAll(() => const HomeScreen());
                        }
                      },
                      child: controller.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : "Login".text.white.make(),
                    ),
                  ),
                ),
                15.heightBox,
                "Forgot the password?".text.size(16).make(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "Don’t have an account?".text.size(16).make(),
                    5.widthBox,
                    "Contuct us".text.size(16).make(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
