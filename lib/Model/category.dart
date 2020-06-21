import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category{
  final int id;
  final String name;
  final dynamic icon;
  Category(this.id, this.name, {this.icon});

}




final List<Category> categories = [
  Category(1,"Quran", icon: FontAwesomeIcons.quran),
  Category(2,"Hadith", icon: FontAwesomeIcons.mosque),
  Category(3,"Fiqh", icon: FontAwesomeIcons.broadcastTower),
  Category(4,"Sunnah", icon: FontAwesomeIcons.calendar ),

];