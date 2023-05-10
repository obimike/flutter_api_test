import 'package:api_test/src/models/single_product_model.dart';
import 'package:api_test/src/services/api_service.dart';
import 'package:flutter/material.dart';

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen({super.key});

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  bool isLoading = false;
  String loadingText = "";
  var single_product;
  var images = [];

  fetchSingleProduct() async {
    setState(() {
      loadingText = "Loading...";
      isLoading = true;
    });

    try {
      final  product = await ApiServices().getSingleProduct();
       print(product);

       debugPrint(product.images.toString());
       setState(() {
         single_product = product;
         loadingText = "";
         isLoading = false;
         images = single_product.images;
       });
    } on Exception catch (e) {

      print(e);
      setState(() {
        single_product = null;
        loadingText = "Error...";
        isLoading = false;
        images = [];
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single Product"),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Wrap(
                  runSpacing: 8,
                  spacing: 12,
                  direction: Axis.vertical,
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            fetchSingleProduct();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(48),
                            ),
                          ),
                          child: const Text(
                            "Get Single product",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Text(
                          loadingText,
                          style: const TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    const Text(
                      "Result",
                      style: TextStyle(
                        fontSize: 24,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Text(
                      'ID: ${single_product == null ? " " : single_product?.id}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Title: ${single_product == null ? " " : single_product?.title}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Description: ${single_product == null ? " " : single_product?.description}",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Text(
                      "Price: ${single_product == null ? " " : single_product?.price}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    const Text(
                      "Images:",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 1,),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 20,
                    direction: Axis.horizontal,
                    children: images
                        .map(
                          (item) => Image.network(
                            item,
                            width: MediaQuery.of(context).size.width * 0.50,
                            loadingBuilder: (BuildContext context, Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded /
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
