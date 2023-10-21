import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log_in/components/my_button.dart';
import 'package:log_in/components/my_textfield.dart';
import 'package:log_in/components/square_tile.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user up method
  void signUserUp() async {
    // show editing controllers
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(), //işlem yapılırken dönen animasyon
        );
      },
    );

    // try creating the user
    try {
      //check if password is confirmed
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        //show error message , password don't match
        showErrorMessage("Passwords don't match !");
      }
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
          backgroundColor: Colors.deepPurple,
          title: Center(
              child: Text(
            message,
            style: const TextStyle(color: Colors.white),
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
                      height: 20,
                    ),

                    //logo
                    Icon(
                      Icons.lock,
                      size: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //Let's create an account for you !
                    Text(
                      'Let\'s create an account for you !',
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

                    //confirm  password textfield
                    MyTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obsureText: true,
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //sign up button
                    MyButton(
                      onTap: signUserUp,
                      text: "Sign Up",
                    ),
                    SizedBox(
                      height: 40,
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
                          'Already have an account ?',
                          style: TextStyle(color: Colors.grey[300]),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            'Login now',
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
