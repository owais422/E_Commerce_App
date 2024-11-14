import 'package:flutter/material.dart';
import 'package:final_project/screens/home_screen.dart';
import 'package:final_project/widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_project/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPassowrd = true;
  void LoginFunction() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "LogIn Screen",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                label: Text("E-mail"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: showPassowrd
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  onPressed: () {
                    if (showPassowrd) {
                      showPassowrd = !showPassowrd;
                    } else {
                      showPassowrd = !showPassowrd;
                    }

                    setState(() {});
                  },
                ),
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                label: const Text("Password"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
                btnText: "Login",
                btnWidth: double.infinity,
                onPress: LoginFunction),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {},
                child: const Text(
                  "Forget Password?",
                  style: TextStyle(
                      color: Color(0xffC1272D),
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      letterSpacing: 1),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                      color: const Color(0xff5A5B5B),
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      letterSpacing: 1),
                ),
                const SizedBox(
                  width: 4,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Color.fromARGB(255, 27, 97, 209),
                        letterSpacing: 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
