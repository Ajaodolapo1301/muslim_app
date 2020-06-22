import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category{
  final int id;
  final String name;
  final dynamic icon;
  Category(this.id, this.name, {this.icon});

}




final List<Category> categories = [
  Category(1,"quran", icon: FontAwesomeIcons.quran),
  Category(2,"hadith", icon: FontAwesomeIcons.mosque),
  Category(3,"fiqh", icon: FontAwesomeIcons.broadcastTower),
  Category(4,"sunnah", icon: FontAwesomeIcons.calendar ),

];