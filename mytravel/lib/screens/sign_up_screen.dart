import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytravel/screens/sign_in_screen.dart';
import 'package:mytravel/widgets/mybutton.dart';
import 'package:mytravel/widgets/mytextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final pwdController = TextEditingController();

  final repwdController = TextEditingController();

  //get createUserWithEmailAndPassword => null;
  signUpWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, 
        password: pwdController.text
        );
        print("Created account.");

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SignInPage()),
      );

    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: [
                Text(
                  'Welcome to our community',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  '\nTo get started, please provide your information and create an account.\n',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
        
                const SizedBox(height: 20,),
                MyTextField(
                  controller: nameController,
                  labelText: "Name",
                  hintText: "Enter your name",
                  obscureText: false,
                ),
        
                const SizedBox(height: 20,),
                MyTextField(
                  controller: emailController,
                  labelText: "Email",
                  hintText: "Enter your email",
                  obscureText: false,
                ),
        
                const SizedBox(height: 20,),
                MyTextField(
                  controller: pwdController,
                  labelText: "Password",
                  hintText: "Enter your password",
                  obscureText: true,
                ),
        
                const SizedBox(height: 20,),
                MyTextField(
                  controller: repwdController,
                  labelText: "Confirm Password",
                  hintText: "Enter your password again.",
                  obscureText: true,
                ),
        
                const SizedBox(height: 30,),
        
                //MyButton(onTap: signUpWithEmailAndPassword, hinText: "Sign up", labelText: 'Sign up',),
                MyButton(onTap: () {
                   signUpWithEmailAndPassword(); 
                   }, labelText: 'Sign Up', hinText: 'Sign Up',),
                //MyButton(onTap: (){}, labelText: 'Sign up',),
        
                const SizedBox(height: 30,),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have a member?',
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displaySmall,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ), ),
                    const SizedBox( width: 1, ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInPage(),
                          ), ); },
                        child: Text(
                          'Sign in.',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.displaySmall,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            color: Colors.blue,
                  ), ), ), ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
