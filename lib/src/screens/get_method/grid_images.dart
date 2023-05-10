import 'package:api_test/src/models/single_product_model.dart';
import 'package:api_test/src/services/api_service.dart';
import 'package:api_test/src/widgets/image_lists.dart';
import 'package:flutter/material.dart';

class ImageGrid extends StatefulWidget {
  const ImageGrid({Key? key}) : super(key: key);

  @override
  State<ImageGrid> createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Grid"),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: FutureBuilder(
            future: ApiServices().getSingleProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot);
                return const Center(
                  child: Text('An error has occurred!'),
                );
              } else if (snapshot.hasData) {
                print(snapshot.data);
                return ImagesList(images: snapshot.data!.images);

                // return  Center(
                //   child: Text(snapshot.data.toString()),
                // );
              } else {

                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
