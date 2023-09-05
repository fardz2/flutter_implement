import 'package:coba/controlller/product_list_provider.dart';
import 'package:coba/page/details/DetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllItems extends StatelessWidget {
  const AllItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListProvider>(
        builder: (context, productListProvider, child) {
      final products = productListProvider.products;

      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: products.map((item) {
            int index =
                products.indexWhere((items) => items.title == item.title);
            return GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    Hero(
                      tag: item.title,
                      child: Container(
                        width: 155.0,
                        height: index % 2 == 0 ? 220.0 : 270,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(item.image)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.only(top: 15, right: 10),
                        height: 35,
                        width: 35,
                        child: TextButton(
                          onPressed: () => productListProvider.toggleLike(item),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                      Colors.black)),
                          child: Icon(
                            item.isLiked
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ]),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                    width: 150.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: GoogleFonts.encodeSans(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text('Dress Modern',
                            style: GoogleFonts.encodeSans(
                                textStyle: const TextStyle(
                                    fontSize: 9, color: Colors.grey))),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$ ${item.price}',
                                style: GoogleFonts.encodeSans(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13))),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text("5.00",
                                    style: GoogleFonts.encodeSans(
                                        textStyle:
                                            const TextStyle(fontSize: 13)))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(title: item.title)),
                );
              },
            );
          }).toList(),
        ),
      );
    });
  }
}
