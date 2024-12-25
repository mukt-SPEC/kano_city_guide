import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/core/textstyle.dart';

import '../providers/auth_provider.dart';

class BottomModal extends StatefulWidget {
  const BottomModal({super.key});

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerUsername = TextEditingController();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();
  bool hasAnAccount = true;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    final double screenHeight = MediaQuery.of(context).size.height;
    double? sheetHeigt = screenHeight * 0.7;
    return Container(
      height: sheetHeigt,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            hasAnAccount ? 'Sign Up' : 'Sign In',
            style: kTextStyle(28, textWeight: TextWeight.semiBold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            hasAnAccount
                ? 'Create an account with us'
                : 'Enter your credentials',
            style: kTextStyle(16, textWeight: TextWeight.normal),
          ),
          const SizedBox(
            height: 20,
          ),
          hasAnAccount
              ? Column(
                  children: [
                    TextField(
                      onTap: () => setState(() {}),
                      style: kTextStyle(14),
                      controller: _controllerUsername,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'e.g john  doe',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xffb9b9b9),
                          ),
                        ),
                        focusColor: const Color(0xff121212),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                )
              : const SizedBox(),
          TextField(
            onTap: () => setState(() {}),
            focusNode: focusNodeEmail,
            style: kTextStyle(14),
            controller: _controllerEmail,
            decoration: InputDecoration(
              labelText: 'Email Address',
              hintText: 'e.g johndoe@gmail.com',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xffb9b9b9),
                ),
              ),
              focusColor: const Color(0xff121212),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            focusNode: focusNodePassword,
            style: kTextStyle(14),
            controller: _controllerPassword,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xffb9b9b9),
                ),
              ),
              focusColor: const Color(0xff121212),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () async {
                hasAnAccount
                    ? await authProvider.signUp(
                        context,
                        _controllerUsername.text.trim(),
                        _controllerEmail.text.trim(),
                        _controllerPassword.text.trim(),
                      )
                    : await authProvider.signIn(
                        context,
                        _controllerEmail.text.trim(),
                        _controllerPassword.text.trim(),
                      );

                Navigator.of(context).pop();
              },
              child: authProvider.isloading!
                  ? const CircularProgressIndicator()
                  : Text(
                      hasAnAccount ? 'Sign Up' : 'Sign In',
                      style: kTextStyle(18,
                          textWeight: TextWeight.semiBold,
                          color: const Color(0xffffffff)),
                    ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                hasAnAccount
                    ? 'Already have an account'
                    : 'Don\'t have an account',
                style: kTextStyle(12),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    hasAnAccount = !hasAnAccount;
                  });
                },
                style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                ),
                child: Text(
                  hasAnAccount ? 'Sign In' : 'Sign Up',
                  style: kTextStyle(14, color: Colors.blue),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
