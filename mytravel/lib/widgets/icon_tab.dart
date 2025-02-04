import 'package:flutter/material.dart';
import 'package:mytravel/constants/colors.dart';
import 'package:mytravel/widgets/icon_widget.dart';

class IconTab extends StatelessWidget {
  const IconTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconWidget(title: 'Forest', color: forestColor, icon: Icons.map),
        SizedBox(width: 30,),
        IconWidget(title: 'Camping', color: campingColor, icon: Icons.fire_hydrant),
        SizedBox(width: 30,),
        IconWidget(title: 'Boat trip', color: boatColor, icon: Icons.tsunami),
        SizedBox(width: 30,),
        IconWidget(title: 'Hiking', color: campingColor, icon: Icons.landslide),
        SizedBox(width: 30,),
        IconWidget(title: 'World tour', color: forestColor, icon: Icons.landscape),
      ],
    );
  }
}

