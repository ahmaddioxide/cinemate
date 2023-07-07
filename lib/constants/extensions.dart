

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext{

  Size? size (){
    return MediaQuery.of(this).size;
  }

  TextTheme textTheme (){
    return Theme.of(this).textTheme;
  }

}