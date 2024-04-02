import 'package:car_app/helper/show_notify.dart';
import 'package:car_app/screens/confirm_order_screen.dart';
import 'package:car_app/shared/navigation.dart';
import 'package:car_app/widgets/button_modal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final _formKey = GlobalKey<FormState>();

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.price});

  final int price;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedPayment = 0;

  int type = 0;

  final Map<String, String> method = {
    "Amazon Pay": "images/amazon_pay.png",
    "Paypal": "images/paypal.png",
    "Visa": "images/visa.png",
    "Google Pay": "images/google_pay.png",
  };
  bool isPaymentSelected = false;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.addListener(() => setState(() {}));
    emailController.addListener(() => setState(() {}));
    addressController.addListener(() => setState(() {}));
    phoneController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    int subTotal = widget.price;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Payment"),
          leading: const BackButton(),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Column(
                            children: List.generate(
                              method.length,
                              (index) {
                                return Column(
                                  children: [
                                    paymentMethod(
                                        method.keys.elementAt(index),
                                        index + 1,
                                        method.values.elementAt(index)),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Customer Info",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          buildCusInfo()
                        ],
                      ),
                      const SizedBox(
                        height: 40,
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
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                NumberFormat.simpleCurrency(
                                        locale: "en_US", decimalDigits: 0)
                                    .format(subTotal),
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
                            onTap: isPaymentSelected
                                ? () {
                                    goToScreen(
                                        context,
                                        ConfirmOrderScreen(
                                          price: subTotal,
                                          paymentType: type,
                                          name: nameController.text,
                                          email: emailController.text,
                                          phone: phoneController.text,
                                          address: addressController.text,
                                        ));
                                  }
                                : () => showNotify(
                                    context,
                                    "animation/error.json",
                                    "Not choose payment method",
                                    400),
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
          ),
        ));
  }

  Form buildCusInfo() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              cursorColor: Theme.of(context).primaryColor,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  floatingLabelStyle:
                      TextStyle(color: Theme.of(context).primaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  prefixIcon: const Icon(Icons.person),
                  suffixIcon: nameController.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          onPressed: () {
                            nameController.clear();
                          },
                          icon: const Icon(Icons.close)),
                  labelText: "Name",
                  border: const OutlineInputBorder()),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (name) => name == "" ? "Please enter name" : "",
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              cursorColor: Theme.of(context).primaryColor,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  floatingLabelStyle:
                      TextStyle(color: Theme.of(context).primaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  prefixIcon: const Icon(Icons.email),
                  suffixIcon: nameController.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          onPressed: () {
                            nameController.clear();
                          },
                          icon: const Icon(Icons.close)),
                  labelText: "Email",
                  border: const OutlineInputBorder()),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validateEmail,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: addressController,
              cursorColor: Theme.of(context).primaryColor,
              keyboardType: TextInputType.streetAddress,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  floatingLabelStyle:
                      TextStyle(color: Theme.of(context).primaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  prefixIcon: const Icon(Icons.location_on),
                  suffixIcon: nameController.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          onPressed: () {
                            nameController.clear();
                          },
                          icon: const Icon(Icons.close)),
                  labelText: "Address",
                  border: const OutlineInputBorder()),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validateEmail,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: phoneController,
              cursorColor: Theme.of(context).primaryColor,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  floatingLabelStyle:
                      TextStyle(color: Theme.of(context).primaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  prefixIcon: const Icon(Icons.phone),
                  suffixIcon: nameController.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          onPressed: () {
                            nameController.clear();
                          },
                          icon: const Icon(Icons.close)),
                  labelText: "Phone",
                  border: const OutlineInputBorder()),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validateEmail,
            ),
          ],
        ));
  }

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w\-\.]+@([\w-]+\.)+[\w-]{2,}$');
    final isValidEmail = emailRegex.hasMatch(email ?? '');
    if (!isValidEmail) {
      return "Please enter valid email";
    } else {
      return null;
    }
  }

  InkWell paymentMethod(String method, int value, String image) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedPayment = value;
          type = value;
          isPaymentSelected = true;
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
