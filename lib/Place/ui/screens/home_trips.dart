import 'package:flutter/material.dart';
import 'package:flutter__trips/Place/ui/widgets/description_place.dart';
import 'package:flutter__trips/Place/ui/screens/header_appbar.dart';
import 'package:flutter__trips/Place/ui/widgets/review_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            DescriptionPlace('Lugar', 2,
                'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las \n\nindustrias des No to de relleno en documentos electrónicos, quedando esencialmente igual al original'),
            ReviewList(3),
          ],
        ),
        HeaderAppbar(),
      ],
    );
  }
}
