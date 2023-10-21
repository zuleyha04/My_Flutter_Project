import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log_in/components/my_button.dart';
import 'package:log_in/components/my_textfield.dart';
import 'package:log_in/components/square_tile.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // show editing controllers
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(), //işlem yapılırken dönen animasyon
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      //pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      Navigator.pop(context);
      //show error message
      showErrorMessage(e.code);
    }
  }

  //error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(
              child: Text(
            message,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      // SingleChildScrollView ekranı kaydırılabilir yaptı ve taşmayı önledi.
      body: Stack(
        children: [
          Image.asset(
            'lib/images/pexels-anni-roenkae-4175070.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),

                    //logo
                    Icon(
                      Icons.lock,
                      size: 100,
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    //welcome back , you've been missed!
                    Text(
                      'Welcome back  you\'ve been missed!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),

                    //email textfield
                    MyTextField(
                      controller: emailController,
                      hintText: 'Email', //arkada görünen yazı
                      obsureText: false, //ekranda gizlemek için kullanılır
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //password textfield
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obsureText: true,
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    //forgot password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password ?',
                            style: TextStyle(color: Colors.grey[300]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //sign in button
                    MyButton(
                      onTap: signUserIn,
                      text: "Sign In",
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    //or continue with
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7, // Çizginin kalınlığı
                              color: Colors.grey[300],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              ' Or continue with ',
                              style: TextStyle(color: Colors.grey[300]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey[300],
                            ),
                          ),
                          //İki ayrı Expanded widget kullanılmasının nedeni,metni ve ayırıcı çizgileri yatay eksende düzenlemekve görünümlerini düzenli ve dengeli hale getirmektir.
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    //google button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SquareTile(
                          imagePath: 'lib/images/google.png',
                        ),
                        SizedBox(
                          width: 25,
                        ),

                        //apple button
                        SquareTile(
                          imagePath:
                              'lib/images/apple-logo-E3DBF3AE34-seeklogo.com.png',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    //not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member ?',
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            'Register now',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
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
