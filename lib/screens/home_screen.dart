import "package:final_project/data/cart_items.dart";
import "package:final_project/screens/cart_screen.dart";
import "package:final_project/widgets/product_container.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int cartUpdate = 0;

  void cartIncrement() {
    cartUpdate = cartItems.length++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery address",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            Text(
              "Salagita City, Central Java",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              //Text("${cartUpdate}"),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(
                          cartvalue: cartUpdate,
                        ),
                      ));
                },
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  label: Text("Search"),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 150,
                child: ListView(
                  //  controller: ,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/sliderImage2.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/sliderImage1.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Category",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/fashion 1.png",
                      width: 50, height: 50),
                  Image.asset("assets/images/Group 8.png",
                      width: 50, height: 50),
                  Image.asset("assets/images/fashion 2.png",
                      width: 50, height: 50),
                  Image.asset("assets/images/Group 8 (1).png",
                      width: 50, height: 50),
                  Image.asset("assets/images/Category.png",
                      width: 50, height: 50),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Recent Product"),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text("Filters"),
                        Icon(Icons.filter_list_sharp),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * .99,
                  child: ProductContainer(
                    onpress: cartIncrement,
                    cartUpdate: cartItems.length,
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "WishList"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: "Account")
        ],
      ),
    );
  }
}
