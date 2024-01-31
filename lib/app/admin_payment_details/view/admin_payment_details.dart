import 'package:edgefly_super_admin/app/admin_payment_details/controller/admin_payment_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class AdminPaymentDetails extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var questionData;
  AdminPaymentDetails({super.key, this.questionData});

  @override
  Widget build(BuildContext context) {
    AdminPaymentDetailsController controller =
        Get.put(AdminPaymentDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: "payment details".text.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: context.screenWidth,
          height: context.screenHeight * .5,
          padding: EdgeInsets.all(context.screenHeight * .05),
          decoration: BoxDecoration(
            color: const Color(0xff4bb050),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(context.screenHeight * .02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Number: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Expanded(
                      child: Text(
                        "${questionData['number']}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              10.heightBox,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(context.screenHeight * .02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Amount: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Expanded(
                      child: Text(
                        "${questionData['amount']}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              10.heightBox,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(context.screenHeight * .02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Time: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Expanded(
                      child: Text(
                        "${questionData['time']}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                    width: context.screenWidth * .3,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffff0000)),
                      onPressed: () async {
                        await controller.rejectPayment(context, questionData);
                        Get.back();
                      },
                      child: Obx(
                        () => controller.isloadings.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                "reject",
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: context.screenWidth * .3,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff0093d4)),
                      onPressed: () async {
                        await controller.acceptPayment(context, questionData);
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      child: Obx(
                        () => controller.isloading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white),
                              )
                            : const Text(
                                "Accept",
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
