import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail(
      {super.key,
      required this.title,
      required this.id,
      required this.product,
      required this.images});

  final String title;
  final int id;
  final dynamic product;
  final List images;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 20,
                      direction: Axis.horizontal,
                      children: images
                          .map(
                            (item) => Image.network(
                              item.toString(),
                              width: MediaQuery.of(context).size.width,
                              height: 240,
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  heightFactor: 240,
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),

                  // Image.network(
                  //   product["thumbnail"],
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 240,
                  //   fit: BoxFit.cover,
                  //   loadingBuilder: (BuildContext context, Widget child,
                  //       ImageChunkEvent? loadingProgress) {
                  //     if (loadingProgress == null) return child;
                  //     return Center(
                  //       child: CircularProgressIndicator(
                  //         value: loadingProgress.expectedTotalBytes != null
                  //             ? loadingProgress.cumulativeBytesLoaded /
                  //                 loadingProgress.expectedTotalBytes!
                  //             : null,
                  //       ),
                  //     );
                  //   },
                  // ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Text(
                        'Price: USD${product["price"]}',
                        style: TextStyle(color: Colors.grey[900], fontSize: 18),
                      ),
                      const Spacer(),
                      Text(
                        'Rating: ${product["rating"]}',
                        style: TextStyle(color: Colors.grey[900], fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      product["description"],
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
