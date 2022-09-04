// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:e_commerce_app/model/item.dart';
import 'package:e_commerce_app/pages/check_out.dart';
import 'package:e_commerce_app/pages/details_screen.dart';
import 'package:e_commerce_app/provider/cart.dart';
import 'package:e_commerce_app/shared/app_bar.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_app/shared/colors.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text("Home"),
        // ignore: prefer_const_constructors
        actions: [ProductAndPrice()],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Text(
                    "Mohamed Elsayed",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  accountEmail: Text(
                    "Mohamed12@Gmail.com",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/img/me.JPG"),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/flowers.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text("Home"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text("My Products"),
                  leading: const Icon(Icons.add_shopping_cart),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckOut(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text("About"),
                  leading: const Icon(Icons.help_center),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Log out"),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () {},
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: const Text(
                "Devolped By Mohamed Elsayed",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: Wrap(
          children: items.map((e) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.50,
              height: MediaQuery.of(context).size.height * 0.2,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(
                        product: e,
                      ),
                    ),
                  );
                },
                child: GridTile(
                  footer: GridTileBar(
                    trailing: Consumer<Cart>(
                      builder: (context, value, child) => IconButton(
                        color: const Color.fromARGB(255, 62, 94, 70),
                        onPressed: () {
                          value.add(e);
                        },
                        icon: const Icon(
                          Icons.add,
                          color: bTNgreen,
                        ),
                      ),
                    ),
                    leading: Text(
                      "\$${e.price}",
                      style: const TextStyle(
                        color: bTNgreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: const Text(""),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(55),
                    child: Image.asset(e.imgPath),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
