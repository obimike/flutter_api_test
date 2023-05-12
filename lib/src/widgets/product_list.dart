import 'package:api_test/src/screens/details/ProductDetails.dart';
import 'package:flutter/material.dart';

class ListsOfProduct extends StatelessWidget {
  const ListsOfProduct({super.key, required this.products});

  final List<dynamic> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return InkWell(
          splashColor: Colors.black12,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetail(
                title: products[index]["title"],
                id: products[index]["id"],
                product: products[index],
                images: products[index]["images"],
              ),
            ));
          },
          child: Container(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                Image.network(
                  products[index]["thumbnail"],
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.width * 0.25,
                ),
                const SizedBox(
                  width: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.62,
                        child: Text(
                          products[index]["title"],
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        )),
                    const SizedBox(
                      height: 25,
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.62,
                    //   child: Text(
                    //     products[index]["description"],
                    //     style: TextStyle(color: Colors.grey[600]),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Price: USD${products[index]["price"]}',
                          style: TextStyle(color: Colors.grey[900]),
                        ),
                        const SizedBox(
                          width: 45,
                        ),
                        Text(
                          'Rating: ${products[index]["rating"]}',
                          style: TextStyle(color: Colors.grey[900]),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
