class Destination {
  late String name;
  late String image;
  late String rate;
  late String location;

  Destination(this.name, this.image, this.rate, this.location);
}

List<Destination> destinations = [
  Destination("Mountain", "assets/images/view1.jpg", "5.0", "Ubon, Thai"),
  Destination("Tree", "assets/images/view2.jpg", "4.5", "Non, Thai"),
  Destination("Sky", "assets/images/view3.jpg", "4.8", "Ubon, Thai"),
  Destination("Lake", "assets/images/view4.jpg", "5.0", "Nakon, Thai"),
  Destination("Sea", "assets/images/view5.jpg", "4.5", "Phuket, Thai"),
  Destination("Wood", "assets/images/view6.jpg", "5.0", "Krabi, Thai")
];  