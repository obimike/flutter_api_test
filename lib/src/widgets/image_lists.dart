import 'package:api_test/src/models/single_product_model.dart';
import 'package:flutter/material.dart';

class ImagesList extends StatelessWidget {
  const ImagesList({super.key, required this.images});

  final List<dynamic> images;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Image.network(images[index].toString(),  height: MediaQuery.of(context).size.height * 0.65,);
      },
    );


  }
}
