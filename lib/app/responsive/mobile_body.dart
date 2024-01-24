import 'package:edgefly_super_admin/app/widgets/drower.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: "Dashboard".text.make(),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              "Dashboard".text.make(),
            ],
          ),
        ),
      ),
    );
  }
}
