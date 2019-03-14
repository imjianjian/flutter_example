import 'dart:math';
import 'dart:ui';

class ColorUtils{
  Color RandomColor(){
    return Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
  }
}