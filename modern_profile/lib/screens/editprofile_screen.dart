import 'package:flutter/material.dart';
import 'package:modern_profile/components/profile_img.dart';
import 'package:modern_profile/components/profile_menu.dart';
import 'package:modern_profile/constant/constant.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ProfileImage(),
          SizedBox(
            height: 20,
          ),
          Text(
            "Mr.Nirapat Jaruvarakul",
            style: texttitle,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "s6503051624190@email.kmutnb.ac.th",
            style: textSubTitle,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(25.0)),
            child: Center(
              child: Text(
                "Edit Profile",
                style: textBtn,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ProfileMenu(
            title: "User Manage",
            icons: Icons.person,
          ),
          SizedBox(
            height: 15,
          ),
          ProfileMenu(
            title: "Billing Detail",
            icons: Icons.wallet,
          ),
          SizedBox(
            height: 15,
          ),
          ProfileMenu(
            title: "QR Code",
            icons: Icons.qr_code,
          ),
          SizedBox(
            height: 15,
          ),
          ProfileMenu(
            title: "Setting",
            icons: Icons.settings,
          ),
          SizedBox(
            height: 15,
          ),
          ProfileMenu(
            title: "Logout",
            icons: Icons.logout,
          ),
        ],
      ),
    );
  }
}