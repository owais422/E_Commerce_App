import 'package:final_project/data/cart_items.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.cartvalue});
  final int cartvalue;
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int qty = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Your Cart"),
        actions: [
          Stack(
            children: [
              const Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ),
              Positioned(
                left: -0,
                right: -0,
                top: -15,
                bottom: -4,
                child: CircleAvatar(
                    maxRadius: 2,
                    minRadius: 1,
                    backgroundColor: const Color.fromARGB(230, 244, 67, 54),
                    child: Text(
                      "${cartItems.length}",
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    )),
              ),
            ],
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery to"),
                Text("Salagita City, Central Java")
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Image.asset(
                        "assets/images/img.png",
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(text: cartItems[index]["name"]),
                              TextSpan(text: cartItems[index][""])
                            ]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(cartItems[index]["price"].toString()),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        // qty--;
                                        // setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.arrow_downward,
                                        size: 20,
                                      )),
                                  Text("$qty"),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_upward,
                                        size: 20,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        cartItems.removeAt(index);
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        size: 20,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
            const Spacer(),
            const Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text("Total Amount"), Text("243")],
              ),
            )
          ],
        ),
      ),
    );
  }
}
