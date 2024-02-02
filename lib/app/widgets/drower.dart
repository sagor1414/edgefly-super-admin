import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../admin_payment/view/admin_payment.dart';
import '../home/view/home.dart';
import '../pending_ question/view/pending_question.dart';
import '../settings/view/setting_view.dart';
import '../user_payment/view/user_payment.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    width: context.screenHeight * .1,
                    height: context.screenHeight * .1,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(context.screenHeight * .06),
                    ),
                    child: Image.asset(
                      'assets/icons/profile.png',
                      width: context.screenHeight * .1,
                      height: context.screenHeight * .1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                "Super Admin".text.make()
              ],
            ),
          )),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Dashboard'),
            onTap: () {
              Get.to(() => const HomeScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              'Pending Question',
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Get.to(() => const PendingQuestions());
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Admin Payment'),
            onTap: () {
              Get.to(() => const PendingAdminPayment());
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('User Payment'),
            onTap: () {
              Get.to(() => const PendingUserPayment());
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Get.to(() => const SettingView());
            },
          ),
        ],
      ),
    );
  }
}
