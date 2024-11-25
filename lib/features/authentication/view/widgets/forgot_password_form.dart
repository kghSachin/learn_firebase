import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/svg_strings.dart';

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFF757575)),
  borderRadius: BorderRadius.all(Radius.circular(100)),
);

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            onSaved: (email) {},
            onChanged: (email) {},
            decoration: InputDecoration(
                hintText: "Enter your email",
                labelText: "Email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: const TextStyle(color: Color(0xFF757575)),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                suffix: SvgPicture.string(
                  mailIcon,
                ),
                border: authOutlineInputBorder,
                enabledBorder: authOutlineInputBorder,
                focusedBorder: authOutlineInputBorder.copyWith(
                    borderSide: const BorderSide(color: Color(0xFFFF7643)))),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color(0xFFFF7643),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            child: const Text("Continue"),
          )
        ],
      ),
    );
  }
}
