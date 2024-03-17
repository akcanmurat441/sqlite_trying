import 'package:flutter/material.dart';

import '../shopping_provider.dart';

class FabWidget extends StatelessWidget {
  const FabWidget({
    super.key,
    required this.shoppingListState,
  });

  final ShoppingListState shoppingListState;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(255, 46, 73, 95),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            final TextEditingController controller = TextEditingController();
            return AlertDialog(
              title: const Text('Veri Ekle'),
              content: TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: 'Veri Adı Gir'),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('İptal'),
                ),
                TextButton(
                  onPressed: () {
                    shoppingListState.addItem(controller.text);
                    Navigator.pop(context);
                  },
                  child: const Text('Ekle'),
                ),
              ],
            );
          },
        );
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
