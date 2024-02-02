import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

void showTransactionDetails(BuildContext context, questionData) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(actionsPadding: const EdgeInsets.all(0.0), actions: [
        Container(
          height: context.screenHeight * .6,
          width: context.screenWidth * .8,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 90, 90, 90),
                blurRadius: 10,
              )
            ],
          ),
          child: Column(
            children: [
              Container(
                height: context.screenHeight * .2,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 89, 215, 247),
                      Color(0xff3777c8),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.outbox_outlined,
                      color: Colors.white,
                      size: 65,
                    ),
                    "Withdraw".text.white.size(25).make()
                  ],
                ),
              ),
              10.heightBox,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Account No ".text.size(18).make(),
                  "${questionData['number']}".text.make(),
                  8.heightBox,
                  "Amount".text.size(18).make(),
                  "${questionData['amount']}".numCurrency.text.make(),
                  8.heightBox,
                  "Transaction ID".text.size(18).make(),
                  "${questionData['timestamp']}".text.make(),
                  8.heightBox,
                  "Time and Date".text.size(18).make(),
                  "${questionData['time']}".text.make(),
                  8.heightBox,
                  "Status".text.size(18).make(),
                  "${questionData['status']}"
                      .text
                      .color(
                        questionData['status'] == 'accepted'
                            ? const Color.fromARGB(255, 6, 120, 219)
                            : (questionData['status'] == 'pending'
                                ? Colors.black
                                : Colors.red),
                      )
                      .size(16)
                      .semiBold
                      .make(),
                ],
              )
            ],
          ),
        ),
      ]);
    },
  );
}
