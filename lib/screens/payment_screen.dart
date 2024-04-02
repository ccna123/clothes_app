import 'package:car_app/widgets/button_modal.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedPayment = 0;

  int type = 1;

  final Map<String, String> method = {
    "Amazon Pay": "images/amazon_pay.png",
    "Paypal": "images/paypal.png",
    "Visa": "images/visa.png",
    "Google Pay": "images/google_pay.png",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Payment method"),
          leading: const BackButton(),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        body: SafeArea(
          child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Column(
                      children: List.generate(
                        method.length,
                        (index) {
                          return Column(
                            children: [
                              paymentMethod(method.keys.elementAt(index),
                                  index + 1, method.values.elementAt(index)),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sub-Total",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "\$1123",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shipping-fee",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "\$44",
                              style: TextStyle(
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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Payment",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              "\$123",
                              style: TextStyle(
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
                            // goToScreen(context, ConfirmOrderScreen(price: ));
                          },
                          child: ButtonModal(
                            title: "Confirm payment",
                            bgColor: Theme.of(context).primaryColor,
                            containerWidth:
                                MediaQuery.of(context).size.width / 0.6,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ));
  }

  InkWell paymentMethod(String method, int value, String image) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedPayment = value;
          type = value;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: type == value
                ? Border.all(width: 1, color: Theme.of(context).primaryColor)
                : Border.all(
                    width: 0, color: const Color.fromARGB(255, 184, 184, 184))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Radio(
                  activeColor: Theme.of(context).primaryColor,
                  splashRadius: 20,
                  groupValue: selectedPayment,
                  value: value,
                  onChanged: (value) {},
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  method,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(
                image,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
