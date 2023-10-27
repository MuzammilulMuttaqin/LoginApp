import 'package:flutter/material.dart';
import 'package:login_app/components/loading_button.dart';
import 'package:login_app/theme.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Login!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 18, right: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login', style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: backgroundColor1),
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey[300]!
                        ),
                        borderRadius: BorderRadius.circular(8.0)
                    )
                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Kata Sandi',
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey[300]!
                        ),
                        borderRadius: BorderRadius.circular(8.0)
                    )
                ),
              ),
              SizedBox(height: 16),
              isLoading ? LoadingButton() : SizedBox(
                child: ElevatedButton(
                    onPressed: handleSignIn,
                    child: Text('Masuk',
                    style: TextStyle(
                      color: backgroundColor6,
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    ),)
                ),
                width: double.infinity,
              ),
              Spacer(),
              Container(
                height: 0.5,
                width: double.infinity,
                color: Colors.grey[400]!,
              ),
              SizedBox(height: 16,),
              Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tidak punya akun? ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: secondaryTextColor
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          'Buat Akun',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: biru
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ],
          )
        ),
      ),
    );
  }
}
