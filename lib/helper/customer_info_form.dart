import 'package:car_app/helper/validate_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Form buildCusInfo(
    BuildContext context,
    GlobalKey<FormState> _formKey,
    TextEditingController nameController,
    TextEditingController addressController,
    TextEditingController phoneController,
    TextEditingController emailController) {
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
