import 'package:flutter/material.dart';

import '../../responsive_home/desktor_body.dart';
import '../../responsive_home/mobile_body.dart';
import '../../responsive_home/responsive_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: MobileScaffold(),
      desktopBody: DesktopScaffold(),
    );
  }
}
