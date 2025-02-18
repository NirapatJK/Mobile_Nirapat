import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytravel/widgets/mybutton.dart';
import 'package:mytravel/widgets/mytextfield.dart';


class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final emailController = TextEditingController();
  final pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              Text(
                'Hello, ready to get started?',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.normal,
                ),
              ),
              Text(
                '\nplease sign in with your email and password.\n',
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

              const SizedBox(height: 30,),

              MyButton(onTap: (){}, labelText: 'Sign In',),

              const SizedBox(height: 30,),
              

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member?'),
                  const SizedBox(width: 2,),
                  TextButton(onPressed: () {}, child: const Text('Register now.')),
                ],
              )
        
            ],
          ),
        ),
      ),
    );
  }
}