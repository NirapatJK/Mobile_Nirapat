import 'package:flutter/material.dart';
import 'package:mytravel/constants/colors.dart';

class ProfileWidgets extends StatelessWidget {
  const ProfileWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
     children: [ 
      CircleAvatar(
        backgroundImage: AssetImage('assets/images/profile.jpg'),
        radius: 25,
      ),
      Spacer(),
      Icon(Icons.menu, size: 25.0, color: primaryColors,),
     ],
    );
  }
}