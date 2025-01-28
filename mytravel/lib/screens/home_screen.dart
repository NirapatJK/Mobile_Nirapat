import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mytravel/constants/colors.dart';
import 'package:mytravel/models/data.dart';
import 'package:mytravel/widgets/destination.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
          
            //Row5
            const Row(
              children: [
                Text('Top Destinations', 
               style: TextStyle(
                fontSize: 25,
                color: primaryColors,
                fontWeight: FontWeight.w600,
                ),
                ),
                Spacer(),
                Icon(Icons.tune, size:25, color: primaryColors,),
              ],
            ),
            const SizedBox(height: 20,),
            //Row6
             GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              childAspectRatio: 0.75,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              children: List.generate(destinations.length, (index) {
                var e = destinations[index];
                return AnimationConfiguration.staggeredGrid(
                  position: index, 
                  columnCount: 2, 
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: DestinationWidget(
                        name: e.name, 
                        image: e.image, 
                        rate: e.rate, 
                        location: e.location,
                      ),
                    ),
                  )
                );
              }),
             ),
            ],
          ),
        ),
      ),
    );
  }
}