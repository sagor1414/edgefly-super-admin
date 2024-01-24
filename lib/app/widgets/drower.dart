import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/view/home.dart';
import '../pending_ question/view/pending_question.dart';
import '../settings/view/setting_view.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
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
            leading: const Icon(Icons.wallet),
            title: const Text('Wallet'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.policy),
            title: const Text('Privacy policy'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.comment),
            title: const Text('Terms & condition'),
            onTap: () {},
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
