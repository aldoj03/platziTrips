import 'package:flutter/material.dart';
import '../../../widgets/gradient_back.dart';
import '../widgets/car_img_list.dart';

class HeaderAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [GradientBack('Populares', 300.0), CardListImage()]);
  }
}
