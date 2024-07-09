import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_constants.dart';
import '../../constants/text_style.dart';

class VerifyCodeView extends StatefulWidget {
  const VerifyCodeView({super.key, required this.email});
  final String email;
  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  margin: EdgeInsets.only(top: 40.h),
                  child: Column(children: <Widget>[
                    Text(
                      'Verify Code',
                      style: TextStyleConstant.lightLight42.copyWith(
                        height: 0.9,
                      ),
                    ),
                    Text(
                      "Please enter the code we've sent to ${widget.email}",
                      style: TextStyleConstant.lightLight22.copyWith(
                          color: ColorConstants.neutralLight90, height: 0.9),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildTextField(),
                        _buildTextField(),
                        _buildTextField(),
                        _buildTextField(),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text("Didn't receive OTP?",
                        style: TextStyleConstant.lightLight24.copyWith(
                            color: ColorConstants.neutralLight90,
                            height: 0.9,)),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Resend Code',
                        style: TextStyleConstant.lightLight24.copyWith(
                          color: ColorConstants.primaryLight110,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, AppRoutes.VERIFYCODE);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => VerifyCodeView(email: _emailController.text,))
                        // );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          top: 8.h,
                          bottom: 8.h,
                        ),
                        margin: EdgeInsets.only(
                          bottom: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstants.primaryLight110,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "Verify",
                          style: TextStyleConstant.regularDark24.copyWith(
                            color: ColorConstants.primaryLight10,
                          ),
                        ),
                      ),
                    ),
                  ])),
            )));
  }
  Widget _buildTextField() {
    return SizedBox(
      width: 60.w,
      child: TextFormField(
        textAlign: TextAlign.center,
        initialValue: '-',
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          focusColor: ColorConstants.neutralLight90,
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
