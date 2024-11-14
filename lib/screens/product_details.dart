import 'package:final_project/screens/cart_screen.dart';
import 'package:final_project/widgets/my_button.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.cartvalue});
  final int? cartvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Details Product"),
        actions: [
          Stack(
            children: [
              Text("$cartvalue"),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(
                          cartvalue: cartvalue!,
                        ),
                      ));
                },
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/img.png"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: const Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Air Pods max by Apple"),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "\$1999,99",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: " (219 people buy this)",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                trailing: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.22),
                      blurRadius: 3,
                      spreadRadius: 3,
                    ),
                  ]),
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_border)),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Choose The Color",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 61,
                      height: 41,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    Container(
                      width: 61,
                      height: 41,
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    Container(
                      width: 61,
                      height: 41,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    Container(
                      width: 61,
                      height: 41,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    // Container(
                    //   width: 61,
                    //   height: 41,
                    //   decoration: BoxDecoration(
                    //       color: Colors.yellow,
                    //       borderRadius: BorderRadius.circular(4)),
                    // ),
                    Container(
                      width: 61,
                      height: 41,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/images/b1f170bfba5817dd84429e5b5ebbcc85.jpg"),
                ),
                title: const Text(
                  "Applle Store",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                subtitle: const Text(
                  "Online 12 minutes ago",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                ),
                trailing: ElevatedButton(
                    onPressed: () {}, child: const Text("Follow")),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Description of Product",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit",
                  style: TextStyle(),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                        btnText: "See the Card",
                        btnWidth: 140,
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CartScreen(cartvalue: cartvalue!),
                              ));
                        }),
                    MyButton(
                      btnText: "Buy Now",
                      btnWidth: 140,
                      onPress: () {},
                      btnColor: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
