import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyButton extends StatelessWidget {
  const MyButton({
    super.key,this.onTap, required this.labelText, required String hinText,
  });

  final Function()? onTap;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(25.0),
        //margin: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            labelText, 
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleLarge,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}