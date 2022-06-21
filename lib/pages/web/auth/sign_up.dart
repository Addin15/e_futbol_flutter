import 'package:e_futbol_flutter/auth.dart';
import 'package:e_futbol_flutter/constants/color.dart';
import 'package:e_futbol_flutter/constants/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SignUp extends StatefulWidget {
  const SignUp({this.changePage, Key? key}) : super(key: key);

  final Function(int)? changePage;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: SpinKitChasingDots(color: primary),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 7.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2.h),
            Form(
              key: _formKey,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.sp),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customTextFormField(
                        controller: _usernameController,
                        focusNode: _usernameFocus,
                        hintText: 'Username',
                        prefixIcon: Icon(
                          Icons.person_outline,
                          size: 3.sp,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username can\'t be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 2.h),
                      customTextFormField(
                          controller: _emailController,
                          focusNode: _emailFocus,
                          hintText: 'E-mail',
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            size: 3.sp,
                          ),
                          validator: (value) {
                            if (!RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value!)) {
                              return 'Email is not valid';
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(height: 2.h),
                      customTextFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocus,
                          isObscured: true,
                          hintText: 'Password',
                          prefixIcon: Icon(
                            Icons.password_outlined,
                            size: 3.sp,
                          ),
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'Password should at least 6 characters';
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(height: 2.h),
                      customTextFormField(
                          controller: _confirmPasswordController,
                          focusNode: _confirmPasswordFocus,
                          isObscured: true,
                          hintText: 'Confirm Password',
                          prefixIcon: Icon(
                            Icons.password_outlined,
                            size: 3.sp,
                          ),
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'Password should at least 6 characters';
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(height: 3.h),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.sp),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 3.w,
                            vertical: 2.5.h,
                          ),
                          backgroundColor: primary,
                        ),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          if (_formKey.currentState!.validate()) {
                            AuthService _auth = Provider.of<AuthService>(
                              context,
                              listen: false,
                            );

                            await _auth.register(
                              username: _usernameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              role: 'consumer',
                            );
                          }

                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 3.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontSize: 3.sp,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              widget.changePage!(2);
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 3.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
