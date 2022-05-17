import 'package:flutter/material.dart';
import 'package:rehabbudy/utils/constant/password_decoration.dart';
import 'input_fields_decoration.dart';

class FormInputFields extends StatelessWidget {
  const FormInputFields(
      {Key? key,
      required this.size,
      required this.controller,
      required this.validator,
      required this.textInputType,
      required this.hintText})
      : super(key: key);

  final Size size;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final String hintText;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: size.height * 0.05,
            width: size.width * 0.8,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(8.0))),
        TextFormField(
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.bottom,
          autofocus: false,
          controller: controller,
          keyboardType: textInputType,
          onSaved: (value) {
            controller.text = value!;
          },
          textInputAction: TextInputAction.next,
          validator: validator,
          decoration: inputDecoration(hintText),
        ),
      ],
    );
  }
}

class PasswordInputFields extends StatelessWidget {
  const PasswordInputFields(
      {Key? key,
      required this.size,
      required this.controller,
      required this.validator,
      required this.iconButton,
      required this.obsecureText,
      required this.hintText})
      : super(key: key);

  final Size size;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final String hintText;
  final IconButton iconButton;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: size.height * 0.05,
        width: size.width * 0.8,
      ),
      TextFormField(
        obscureText: obsecureText,
        autofocus: false,
        controller: controller,
        keyboardType: TextInputType.text,
        onSaved: (value) {
          controller.text = value!;
        },
        textInputAction: TextInputAction.done,
        validator: validator,
        decoration: passwordInputDecoration(hintText, iconButton),
      ),
    ]);
  }
}

class PatientFormInputFields extends StatelessWidget {
  final Size size;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final String hintText;
  final TextInputType textInputType;

  PatientFormInputFields(
    this.size,
    this.controller,
    this.validator,
    this.textInputType,
    this.hintText,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: size.height * 0.05,
            width: size.width * 0.98,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(8.0))),
        TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: textInputType,
            textInputAction: TextInputAction.next,
            decoration: formInputDecoration(hintText)),
      ],
    );
  }
}

class Dob_PickerFormFields extends StatelessWidget {
  final Size size;
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator validator;
  final void Function()? onTap;

  Dob_PickerFormFields(
      this.size, this.controller, this.hintText, this.onTap, this.validator);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: size.height * 0.05,
            width: size.width * 0.98,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(8.0))),
        TextFormField(
          controller: controller,
          textInputAction: TextInputAction.next,
          onTap: onTap,
          validator: validator,
          readOnly: true,
          decoration: formInputDecoration(hintText),
        ),
      ],
    );
  }
}

class Gender_PickerFormFields extends StatelessWidget {
  final Size size;
  final TextEditingController controller;
  final String hintText;
  final void Function()? onTap;
  final Map items;

  Gender_PickerFormFields(
      this.size, this.controller, this.hintText, this.onTap, this.items);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: size.height * 0.05,
            width: size.width * 0.98,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(8.0))),
      ],
    );
  }
}
