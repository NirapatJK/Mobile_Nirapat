import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytravel/screens/sign_up_screen.dart';
import 'package:mytravel/widgets/my_iconbtn.dart';
import 'package:mytravel/widgets/mybutton.dart';
import 'package:mytravel/widgets/mytextfield.dart';


class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  
  get signInWithEmailAndPassword => null;

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
        
                Padding( padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                      onPressed: () {},
                      child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.lato(
                      textStyle:
                      Theme.of(context).textTheme.displaySmall,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue, ), ), ), ],
                    ),
                  ),
                  const SizedBox(height: 30,),
        
                 MyButton(onTap: signInWithEmailAndPassword, hinText:"Sign In", labelText: 'Sign In',),
                 //MyButton(onTap: (){}, labelText: 'Sign In',),    
                 // or continue with
                 const SizedBox(height: 30,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:25.0),
                   child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ), ),
                      Padding(
                        padding: const
                        EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color:Colors.grey.shade800),
                                          ), ),
                          Expanded(
                                  child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey.shade400,)),
                        ]          
                       ),
                      ), 
                      const SizedBox(height: 30,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                                MyIconButton(imagPath:'assets/images/google_icon.png'),
                                SizedBox(width: 10,),
                                MyIconButton(imagPath:'assets/images/apple_iconpng.png'),
                                ],
                              ),
        
                //Not a member
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displaySmall,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),),
                    const SizedBox(
                      width: 1,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ), );},
                        child: Text(
                          'Register now.',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displaySmall,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.blue,
                        ), ), ), ], ),          
                      ],
            )
          )
        ),
      )
    );
  }
}