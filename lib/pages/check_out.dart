import 'package:e_commerce_app/provider/cart.dart';
import 'package:e_commerce_app/shared/app_bar.dart';
import 'package:e_commerce_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    final cartt = Provider.of<Cart>(context);
    return Scaffold(
      persistentFooterButtons: [
        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(bTNpink),
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(12),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: Text(
              "pay \$ ${cartt.price}",
              style: const TextStyle(fontSize: 19),
            ),
          ),
        )
      ],
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text("CheckOut Screen"),
        actions: const [
          ProductAndPrice(),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 600,
          child: Consumer<Cart>(
            builder: (context, value, child) => ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: value.selectedItems.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    subtitle:
                        Text("price : \$${value.selectedItems[index].price}"),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(value.selectedItems[index].imgPath),
                    ),
                    title: Text(value.selectedItems[index].name),
                    trailing: IconButton(
                      onPressed: () {
                        cartt.delete(cartt.selectedItems[index]);
                      },
                      icon: const Icon(
                        Icons.remove,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
