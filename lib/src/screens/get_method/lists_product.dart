import 'package:api_test/src/services/api_service.dart';
import 'package:api_test/src/widgets/product_list.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lists of Product"),
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: FutureBuilder(
              future: ApiServices().getProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot);
                  return const Center(
                    child: Text('An error has occurred!'),
                  );
                } else if (snapshot.hasData) {
                  return ListsOfProduct(products: snapshot.data!.products);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ));
  }
}
