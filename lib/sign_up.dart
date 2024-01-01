import 'package:flutter/material.dart';

import 'Components/container_text_filed.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final Color lightBlack = const Color.fromARGB(255, 34, 37, 46);
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
      backgroundColor: lightBlack,
      body: Column(
        children: [
          const SizedBox(
            height: 200,
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
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          const ContainerTextFiled(
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.mail,
                  color: Colors.grey,
                ),
                hintText: 'Email',
                border: InputBorder.none,
              ),
            ),
          ),
          ContainerTextFiled(
            child: TextField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                  icon: const Icon(
                    Icons.lock,
                    color: Colors.grey,
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
                        if (_iconColor == Colors.grey) {
                          _iconColor = Colors.red;
                        } else {
                          _iconColor = Colors.grey;
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
                  fillColor: MaterialStateProperty.all(Colors.red),
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  }),
              const Text('remember me',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
