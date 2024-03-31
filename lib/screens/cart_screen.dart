import 'package:car_app/provider/item_provider.dart';
import 'package:car_app/screens/payment_screen.dart';
import 'package:car_app/shared/navigation.dart';
import 'package:car_app/widgets/button_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<bool> itemSelected = [];

  @override
  Widget build(BuildContext context) {
    var items = context.watch<ItemProvider>().items;
    if (itemSelected.isEmpty) {
      itemSelected = List<bool>.generate(items.length, (index) => false);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListView.builder(
              itemCount: items.length - 3,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = items[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      splashRadius: 20,
                      value: itemSelected[index],
                      onChanged: (value) {
                        setState(() {
                          itemSelected[index] = value!;
                        });
                      },
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        item.image,
                        height: 90,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          item.description,
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[400]),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "\$${item.price}",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(
                          CupertinoIcons.minus,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("123"),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(CupertinoIcons.add)
                      ],
                    )
                  ],
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Select All",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Checkbox(
                  activeColor: Theme.of(context).primaryColor,
                  splashRadius: 20,
                  value: itemSelected.every((isSelected) => isSelected),
                  onChanged: (value) {
                    setState(() {
                      for (var i = 0; i < itemSelected.length; i++) {
                        itemSelected[i] = value ?? false;
                      }
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                goToScreen(context, PaymentScreen());
              },
              child: ButtonModal(
                title: "Go check out",
                bgColor: Theme.of(context).primaryColor,
                containerWidth: MediaQuery.of(context).size.width / 0.6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
