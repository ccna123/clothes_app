import 'package:car_app/helper/show_notify.dart';
import 'package:car_app/widgets/button_modal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen(
      {super.key, required this.price, required this.paymentType});

  final int price;
  final int paymentType;

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  @override
  Widget build(BuildContext context) {
    int subTotal = widget.price;
    double shippingFee = subTotal * 0.1;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirm Order"),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Shipping Address",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              // color: Colors.green,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mit",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Text("8702 斎藤Dale, Apt. 487, 070-4711",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                          Text("港大和町, 奈良県, Japan",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15))
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Change",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFEF6969)),
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Payment Method",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Change",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEF6969)),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 4)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: paymentTypeChangeImage(widget.paymentType),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Text(
                  "**** **** **** 1234",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Method",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Home Delivery",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("2-6 days",
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Sub-Total",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(
                              locale: "en_US", decimalDigits: 0)
                          .format(subTotal),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Shipping-fee",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(
                              locale: "en_US", decimalDigits: 0)
                          .format(shippingFee),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 1,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Payment",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(
                              locale: "en_US", decimalDigits: 0)
                          .format(subTotal + shippingFee),
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    showNotify(context, "animation/done.json",
                        "Order Successfully", 200);
                  },
                  child: ButtonModal(
                    title: "Confirm Order",
                    bgColor: Theme.of(context).primaryColor,
                    containerWidth: MediaQuery.of(context).size.width / 0.6,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Image? paymentTypeChangeImage(int type) {
    switch (type) {
      case 1:
        return Image.asset(
          "images/amazon_pay.png",
        );
      case 2:
        return Image.asset(
          "images/paypal.png",
        );
      case 3:
        return Image.asset(
          "images/visa.png",
        );
      case 4:
        return Image.asset(
          "images/google_pay.png",
        );
      default:
        return null;
    }
  }
}
