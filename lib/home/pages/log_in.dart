import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:untitled4/Components/auth.dart';
import 'package:untitled4/Components/colors.dart';
import 'package:untitled4/Components/text_style.dart';
import 'package:untitled4/home/pages/Sign%20Up.dart';
import 'package:untitled4/home/pages/home_page.dart';
import 'package:untitled4/home/pages/widgets/icon_button.dart';
import 'package:untitled4/home/pages/widgets/my_text_button.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final form = FormGroup(
    {
      'email': FormControl<String>(validators: [
        Validators.required,
        Validators.email,
      ]),
      'password': FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(8),
      ]),
      // 'passwordConfirmation': FormControl<String>(),
    },
    // validators: [
    //   Validators.mustMatch('password', 'passwordConfirmation'),
    //],
  );

  Color _iconColor = Colors.grey;
  var _isObscure;
  bool isChecked = false;

  @override
  initState() {
    super.initState();
    _isObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ReactiveForm(
            formGroup: form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/newl.png',
                    width: 130,
                    height: 130,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Login to your account',
                  style: CustomTextStyle.textStyle3,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReactiveTextField(
                        style: const TextStyle(color: AppColors.white),
                        controller: emailController,
                        formControlName: 'email',
                        validationMessages: {
                          'required': (error) => 'The email must not be empty',
                          'email': (error) =>
                              'The email value must be a valid email'
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: AppColors.white),
                          fillColor: Colors.white24,
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.person,
                            color: AppColors.red,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReactiveTextField(
                        style: TextStyle(color: AppColors.white),
                        controller: passwordController,
                        formControlName: 'password',
                        validationMessages: {
                          'password': (error) =>
                              'password must be 8 characters at least',
                          'required': (error) =>
                              'The password must not be empty',
                          'minLength': (error) =>
                              'The password must be at least 8 characters',
                        },
                        decoration: InputDecoration(
                          hintText: 'password',
                          hintStyle: const TextStyle(color: AppColors.white),
                          fillColor: Colors.white24,
                          filled: true,
                          suffixIcon: IconButton(
                            padding: const EdgeInsetsDirectional.only(end: 1),
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: _iconColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                                if (_iconColor == AppColors.grey) {
                                  _iconColor = AppColors.red;
                                } else {
                                  _iconColor = AppColors.grey;
                                }
                              });
                            },
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: AppColors.red,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: isChecked,
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.all(AppColors.red),
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    Text('remember me',
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.textStyle1),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                ReactiveFormConsumer(
                  builder: (context, form, child) {
                    return ElevatedButton(
                      onPressed: form.valid
                          ? () async {
                              try {
                                final credential = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text);
                                if (credential.user != null) {
                                  print('login success');
                                  // If both forms are valid, navigate to HomePage.
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                                } else {
                                  print('login failed');
                                }
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  print('No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  print(
                                      'Wrong password provided for that user.');
                                }
                              }
                            }
                          : null,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.red),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text('Sign In',
                            textAlign: TextAlign.center,
                            style: CustomTextStyle.textStyle1),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text('or sign in with',
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.textStyle1),
                SizedBox(
                  height: 20.h,
                ),
                MyIconButton(
                  text: Text('Your Google Account ',
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.textStyle1),
                  myIcon: const Icon(
                    Icons.g_mobiledata_sharp,
                    size: 30,
                  ),
                  onTap: () async {
                    var result = await AuthService.signInWithGoogle();
                    if (result != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    } else {
                      print('login failed');
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have an account?',
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.textStyle1),
                    MyTextButton(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      text: const Text('Sign Up'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
