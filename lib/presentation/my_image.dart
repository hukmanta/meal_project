import 'package:flutter_modular/flutter_modular.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_project/extension.dart';
import 'package:meal_project/simple_bloc_delegate.dart';
import 'package:shimmer/shimmer.dart';

class MyImage extends StatelessWidget {
  final String? path;
  final bool isVolta;

  const MyImage({Key? key, this.path, this.isVolta= false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return CachedNetworkImage(
        imageUrl: '$path',
        fit: BoxFit.fill,
        placeholder: (context, url) {
          return Shimmer.fromColors(
            baseColor: basicShimmerColor,
            highlightColor: highlightShimmerColor,
            enabled: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: basicShimmerColor,
              ),
            ),
          );
        },
        errorWidget: (context, object, stackTrace) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFEEEEEE),
            ),
          );
        },
        color: Colors.grey,
        colorBlendMode: BlendMode.overlay,
      );
    } catch (e) {
      Modular.get<SimpleBlocObserver>().logger.w('My Image => error loading Image: $e');
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFEEEEEE),
        ),
      );
    }
  }
}