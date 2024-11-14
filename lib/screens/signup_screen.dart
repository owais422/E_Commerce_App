import 'package:flutter/material.dart';
import 'package:final_project/screens/login_screen.dart';
import 'package:final_project/widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPassowrd = true;
  void SignupFunction() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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
              "SignUp Screen",
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
              obscureText: showPassowrd,
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
                btnText: "SignUp",
                btnWidth: double.infinity,
                onPress: SignupFunction),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "By registering, you agree to our tems and condition ",
                style: TextStyle(
                    color: Color(0xff808080),
                    fontWeight: FontWeight.w900,
                    fontSize: 9,
                    letterSpacing: 0),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already Registered? ",
                  style: TextStyle(
                      color: Color(0xff5A5B5B),
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      letterSpacing: 1),
                ),
                const SizedBox(
                  width: 4,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  child: const Text(
                    "Sign In",
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
