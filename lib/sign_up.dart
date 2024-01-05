import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:untitled4/Components/colors.dart';
import 'package:untitled4/Components/text_style.dart';

import 'Components/container_text_filed.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final form = FormGroup({
    'email': FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ]),
  });

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                const SizedBox(
                height: 150,
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
              const Text(
                'Create your account',
                style: CustomTextStyle.textStyle3,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ContainerTextFiled(
                child: ReactiveForm(
                    formGroup: form,
                    child: Column(
                      children: [
                        ReactiveTextField(
                          formControlName: 'email',
                          validationMessages: {
                            'required': (error) => 'The email must not be empty',
                            'email': (error) =>
                                'The email value must be a valid email'
                          },
                        )
                      ],
                    )),
              ),
              ContainerTextFiled(
                child: TextField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      icon: const Icon(
                        Icons.lock,
                        color: AppColors.grey,
                      ),
                      border: InputBorder.none,
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        padding: const EdgeInsetsDirectional.only(end: 1),
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
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
                      )),
                ),
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
                  const Text('remember me',
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.textStyle1),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.red),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Sign Up',
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.textStyle1),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Row(
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
