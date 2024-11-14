import 'package:final_project/data/cart_items.dart';
import 'package:final_project/data/product_list.dart';
import 'package:final_project/screens/product_details.dart';
import 'package:final_project/widgets/my_button.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatefulWidget {
  const ProductContainer(
      {super.key, required this.cartUpdate, required this.onpress});
  final int cartUpdate;
  final void Function() onpress;
  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 4.0,
            childAspectRatio: 0.65,
          ),
          itemCount: productData.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProductDetails(
                      cartvalue: 4,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 120,
                        child: Image.network(productData[index]["productImage"])

                        // Image.asset(
                        //   "assets/images/img.png",
                        //   fit: BoxFit.cover,
                        // ),
                        ),
                    const SizedBox(height: 8),
                    Text(
                      productData[index]["name"],
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "\$${productData[index]["price"]}",
                      style: const TextStyle(fontSize: 14, color: Colors.green),
                    ),
                    const SizedBox(height: 8),
                    MyButton(
                      btnText: "Add to Cart",
                      btnWidth: 150,
                      onPress: () {
                        cartItems.add(productData[index]);
                        setState(() {});
                        print(cartItems.length);
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
