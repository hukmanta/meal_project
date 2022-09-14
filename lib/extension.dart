// convert pixel to densityPixel base on device
import 'package:flutter/material.dart';

double pixelToDp(BuildContext context,double pixel){
  var ratio = MediaQuery.of(context).devicePixelRatio;
  return pixel/ratio;
}

double defaultMargin(BuildContext context){
  return pixelToDp(context, 22);
}

Color basicShimmerColor = Colors.black;
Color highlightShimmerColor = Colors.amber.withOpacity(0.8);