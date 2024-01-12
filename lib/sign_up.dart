import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:untitled4/Components/colors.dart';
import 'package:untitled4/Components/text_style.dart';
import 'package:untitled4/home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                  height: 150.h,
                ),
                Center(
                  child: Image.asset(
                    'image/assets/newl.png',
                    width: 130,
                    height: 130,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Create your account',
                  style: CustomTextStyle.textStyle3,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReactiveTextField(
                        formControlName: 'email',
                        validationMessages: {
                          'required': (error) => 'The email must not be empty',
                          'email': (error) =>
                              'The email value must be a valid email'
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          fillColor: Colors.white24,
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.person,
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
                          ? () {
                              // If both forms are valid, navigate to HomePage.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                              print(form.value);
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
                        child: Text('Sign Up',
                            textAlign: TextAlign.center,
                            style: CustomTextStyle.textStyle1),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('already have an account?',
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.textStyle1),
                    TextButton(
                        onPressed: null,
                        child: Text(
                          'Sign in ',
                          style: CustomTextStyle.textStyle2,
                        ))
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
// TextField(
// decoration: InputDecoration(
// icon: Icon(
// Icons.mail,
// color: Colors.grey,
// ),
// hintText: 'Email',
// border: InputBorder.none,
// ),
// ),
