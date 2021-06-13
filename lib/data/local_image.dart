import 'package:flutter/material.dart';

List<String> imgList = [
  'https://www.slashgear.com/wp-content/uploads/2019/09/spider-man_main.jpg',
  'https://i.ytimg.com/vi/CpO4w3nb7zI/maxresdefault.jpg',
  'https://iyiindir.com/wp-content/uploads/2021/04/11-8-640x318.jpg',
  'https://i.ytimg.com/vi/EFYEni2gsK0/maxresdefault.jpg',
  'https://s3.amazonaws.com/sfc-datebook-wordpress/wp-content/uploads/sites/2/2021/03/MER8bd0addd34810a3cd6593d67ac4c2_godzilla0331-1024x486.jpg',
  'https://i.ytimg.com/vi/5yd3Vf1t7Hc/maxresdefault.jpg',
  'https://www.themoviedb.org/t/p/original/wF1RaQkfoP5LKGhMP9qbRJpo911.jpg',
  'https://sinefy.com/uploads/newseries/cover/chaos-walking.jpg',
  'https://www.etonline.com/sites/default/files/images/2020-11/1280souldisney.jpg',
  'https://cafecomnerd.com.br/wp-content/uploads/2021/04/f9-the_fast_saga-trailer-insano-do-nono-filme-da-franquia-velozes-e-furiosos.jpg'
];

List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: Image.network(item, fit: BoxFit.cover)),
        ),
      ),
    )
    .toList();
