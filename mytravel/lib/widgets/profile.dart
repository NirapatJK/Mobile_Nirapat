import 'package:flutter/material.dart';
import 'package:mytravel/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytravel/screens/onboarding_screen.dart';
class ProfileWidgets extends StatefulWidget {
  const ProfileWidgets({
    super.key,
  });

  @override
  State<ProfileWidgets> createState() => _ProfileWidgetsState();
}

class _ProfileWidgetsState extends State<ProfileWidgets> {
  signOut() async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
     children: [ 
      const CircleAvatar(
        backgroundImage: AssetImage('assets/images/profile.jpg'),
        radius: 25,
      ),
      Spacer(),
      //Icon(Icons.exit_to_app, size: 28.0, color: Colors.red,),
      IconButton(
        onPressed: signOut, 
        icon: const Icon( 
          Icons.exit_to_app, 
          size: 28.0, 
          color: Colors.red,)
        ),
     ],
    );
  }
}