import 'package:flutter/material.dart';

import '../../responsive/desktor_body.dart';
import '../../responsive/mobile_body.dart';
import '../../responsive/responsive_layout.dart';

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
