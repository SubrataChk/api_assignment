import 'package:api_assignment/src/api/apiservice.dart';
import 'package:api_assignment/src/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../widget/formfield.dart';

class LoginPageSection extends StatefulWidget {
  const LoginPageSection({Key? key}) : super(key: key);

  @override
  State<LoginPageSection> createState() => _LoginPageSectionState();
}

class _LoginPageSectionState extends State<LoginPageSection> {
  TextEditingController email = TextEditingController(text: "mor_2314");
  TextEditingController password = TextEditingController(text: "83r5^_");
  @override
  Widget build(BuildContext context) {
    ApiService apiService = Provider.of<ApiService>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: Lottie.asset("assets/logo.json",
                height: 20.h, width: double.infinity),
          ),
          CustomTextFormField(
            controller: email,
            hintText: "Email",
            icons: CupertinoIcons.mail,
          ),
          CustomTextFormField(
            controller: password,
            hintText: "Password",
            icons: Icons.vpn_key,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
            child: InkWell(
              onTap: () async {
                final getToken =
                    await apiService.userLogin(email.text, password.text);

                if (getToken["token"] != null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Your token is ${getToken["token"]}"),
                    backgroundColor: Colors.blue,
                  ));

                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("There is some error!"),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: Container(
                height: 6.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff525E75),
                    borderRadius: BorderRadius.circular(12)),
                alignment: Alignment.center,
                child: Text(
                  "Log In",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
