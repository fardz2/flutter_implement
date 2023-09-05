// ignore: file_names
import 'package:coba/controlller/product_list_provider.dart';
import 'package:coba/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.title});
  final String title;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int cty = 0;
  @override
  Widget build(BuildContext context) {
    final productListProvider = Provider.of<ProductListProvider>(context);
    final Product items = productListProvider.products
        .firstWhere((item) => item.title == widget.title);

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        top: true,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(items.image), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                )),
                                backgroundColor:
                                    const MaterialStatePropertyAll<Color>(
                                        Colors.white)),
                            child: const Icon(
                              Icons.navigate_before,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: TextButton(
                            onPressed: () {
                              productListProvider.toggleLike(items);
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                )),
                                backgroundColor:
                                    const MaterialStatePropertyAll<Color>(
                                        Colors.white)),
                            child: Icon(
                              items.isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    items.title,
                    style: GoogleFonts.encodeSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              if (cty != 0) {
                                cty--;
                              }
                            });
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                      Colors.white)),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: SizedBox(
                            width: 20,
                            child: Text("$cty",
                                style: GoogleFonts.encodeSans(
                                    textStyle: const TextStyle(fontSize: 16))),
                          )),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              cty++;
                            });
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              )),
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                      Colors.white)),
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("5.00",
                      style: GoogleFonts.encodeSans(
                          textStyle: const TextStyle(fontSize: 16))),
                  Text(
                    "(7.932 reviews)",
                    style: GoogleFonts.encodeSans(
                        textStyle: const TextStyle(fontSize: 16),
                        color: Colors.blue),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ReadMoreText(
                'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                trimLines: 3,
                style: GoogleFonts.encodeSans(
                  textStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                moreStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
                lessStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read more ...',
                trimExpandedText: ' show less',
                colorClickableText: Colors.black,
              ),
            ),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 10,
              endIndent: 10,
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Choose Size",
                          style: GoogleFonts.encodeSans(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Center(
                                child: Text("S",
                                    style: GoogleFonts.encodeSans(
                                        textStyle: const TextStyle(
                                      fontSize: 16,
                                    )))),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Center(
                                child: Text("M",
                                    style: GoogleFonts.encodeSans(
                                        textStyle: const TextStyle(
                                      fontSize: 16,
                                    )))),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Center(
                                child: Text("L",
                                    style: GoogleFonts.encodeSans(
                                        textStyle: const TextStyle(
                                      fontSize: 16,
                                    )))),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Center(
                                child: Text("XL",
                                    style: GoogleFonts.encodeSans(
                                        textStyle: const TextStyle(
                                      fontSize: 16,
                                    )))),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Color",
                          style: GoogleFonts.encodeSans(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(100)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    Text("Add to Cart | ",
                        style: GoogleFonts.encodeSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                            color: Colors.white)),
                    Text('\$ ${items.price}',
                        style: GoogleFonts.encodeSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                            color: Colors.white)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
