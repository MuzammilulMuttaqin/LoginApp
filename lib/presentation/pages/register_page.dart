import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/loading_button.dart';
import '../../providers/auth_provider.dart';
import '../../theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/login');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Register!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar',
              style: TextStyle(
                color: backgroundColor1,
                fontWeight: FontWeight.normal,
                fontSize: 25
              )
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Daftar lalu masuk',
                style: TextStyle(
                    color: secondaryTextColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 14
                )
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              SizedBox(height: 16,),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: 'Nama',
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
                controller: usernameController,
                decoration: InputDecoration(
                    hintText: 'Username',
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
              isLoading ? LoadingButton() : Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.only(top: 30),
                child: TextButton(
                  onPressed: handleSignUp,
                  style: TextButton.styleFrom(
                    backgroundColor: biru,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Daftar',
                    style: TextStyle(
                      color: backgroundColor6,
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah memiliki akun? ',
                      style: TextStyle(
                        color: secondaryTextColor,
                        fontSize: 12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          color: biru,
                          fontSize: 12,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
