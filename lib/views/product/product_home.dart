import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductHome extends StatefulWidget {
  static Color backgroundColor = const Color(0xFF7C9A9A);
  static Color highlightColor = const Color(0xFF8CA7A2);
  static Color unselectedColor = const Color(0xFF68837E);
  static Color accentColor = const Color(0xFFDABBA7);
  static Color textDarkColor = const Color(0xFF5E5E5E);
  static Color textLightColor = const Color(0xFFC4C4C4);
  const ProductHome({Key? key}) : super(key: key);

  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  List<String> categories = ["All", "Shoes", "Cars", "Food", "Pets", "Drinks"];
  List<ShoppingModel> products = [
    ShoppingModel(
        "Ninjas club",
        "Cars",
        50.00,
        const AssetImage("assets/images/polera2.png"),
        "Sublimada",
        "Practical"),
    ShoppingModel("Medikal", "Cars", 80.99,
        const AssetImage("assets/images/polera1.png"), "Economica", "Spacious"),
    ShoppingModel(
        "Nike",
        "Shoes",
        100.99,
        const AssetImage("assets/images/polera3.png"),
        "Confortable",
        "Sportsy"),
    ShoppingModel("Nike Air", "Shoes", 349.99,
        const AssetImage("assets/images/polera1.png"), "Modern", "Popular"),
    ShoppingModel("Peugeot 308", "Cars", 16499.99,
        const AssetImage("assets/images/polera3.png"), "Luxerious", "Fast"),
    ShoppingModel("Timberland", "Shoes", 249.99,
        const AssetImage("assets/images/polera2.png"), "Robust", "Stylish"),
  ];
  int selectedCategories = 0;
  String searchedProduct = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Productos",
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
        backgroundColor: ProductHome.backgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          height: getDividerHeight(index),
                          color: Colors.transparent,
                        ),
                    padding: const EdgeInsets.fromLTRB(5, 8, 5, 8),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return getProductCard(index);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getProductCard(int index) {
    //THIS IS THE SPAGHETTIEST CODE I VE WRITTEN IN YEARS OH DEAR GOD
    if (selectedCategories != 0) {
      if (products[index].tag == categories[selectedCategories]) {
        if (searchedProduct == "") {
          return ShoppingCard(product: products[index]);
        } else {
          if (products[index]
              .title
              .toLowerCase()
              .contains(searchedProduct.toLowerCase())) {
            return ShoppingCard(product: products[index]);
          } else {
            return const SizedBox();
          }
        }
      } else {
        return const SizedBox();
      }
    } else {
      if (searchedProduct == "") {
        return ShoppingCard(product: products[index]);
      } else {
        if (products[index]
            .title
            .toLowerCase()
            .contains(searchedProduct.toLowerCase())) {
          return ShoppingCard(product: products[index]);
        } else {
          return const SizedBox();
        }
      }
    }
  }

  double getDividerHeight(int index) {
    if (selectedCategories == 0) {
      return 5;
    } else {
      if (products[index].tag == categories[selectedCategories]) {
        return 5;
      } else {
        return 0;
      }
    }
  }
}

class ShoppingModel {
  String title;
  String tag;
  String info1, info2;
  double price;
  AssetImage productImage;

  ShoppingModel(this.title, this.tag, this.price, this.productImage, this.info1,
      this.info2);
}

class ShoppingCard extends StatelessWidget {
  final ShoppingModel product;

  const ShoppingCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProductDetails(product: product)));
      },
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Card(
              margin:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 3),
              color: ProductHome.accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
            ),
          ),
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            semanticContainer: true,
            elevation: 1,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          product.title,
                          style: TextStyle(
                              color: ProductHome.textDarkColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          product.info1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ProductHome.textLightColor, fontSize: 16),
                        ),
                        Text(
                          product.info2,
                          style: TextStyle(
                              color: ProductHome.textLightColor, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${product.price} Bs",
                          style: TextStyle(
                              color: ProductHome.accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 125,
                        minHeight: 125,
                      ),
                      child: Hero(
                        tag: product.title,
                        child: Image(
                          image: product.productImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetails extends StatefulWidget {
  final ShoppingModel product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ProductHome.accentColor,
        actions: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(
              Icons.bookmark_border,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        color: ProductHome.accentColor,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Hero(
                    tag: widget.product.title,
                    child: Image(
                      image: widget.product.productImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Expanded(
                          flex: 5,
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(26),
                              topRight: Radius.circular(26),
                            )),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Card(
                            color: Colors.white,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26)),
                            margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Image(
                                        image: widget.product.productImage,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Image(
                                        image: widget.product.productImage,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Image(
                                        image: widget.product.productImage,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(42, 16, 32, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: ProductHome.unselectedColor,
                                    letterSpacing: 2),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                                child: Text(
                                  "${widget.product.info1}\n${widget.product.info2}",
                                  softWrap: true,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              Text(
                                "More...",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: ProductHome.unselectedColor,
                                ),
                              ),
                            ],
                          ),
                        )),
                        Expanded(
                            child: Card(
                          color: ProductHome.backgroundColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(26),
                            topRight: Radius.circular(26),
                          )),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 36, right: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "${widget.product.price} Bs",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 26),
                                ),
                                // FlatButton(
                                //   color: ProductHome.unselectedColor,
                                //   padding: EdgeInsets.fromLTRB(62, 16, 62, 16),
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(16)),
                                //   onPressed: () {},
                                //   child: Text(
                                //     "Pedir",
                                //     style: TextStyle(
                                //         color: Colors.white,
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: 18),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ))
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
