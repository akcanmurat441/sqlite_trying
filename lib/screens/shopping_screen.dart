import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'const/const_item.dart';
import 'shopping_provider.dart';
import 'widgets/fab_widget.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});
  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  late ShoppingListState shoppingListState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await shoppingListState.fetchItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    shoppingListState = context.watch<ShoppingListState>();
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          'Veri Listesi',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 46, 73, 95),
        elevation: 5,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 75.0),
        child: ListView.builder(
          itemCount: shoppingListState.items.length,
          itemBuilder: (context, index) {
            final item = shoppingListState.items[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 228, 228, 228),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: ListTile(
                  leading: Text('${item.id}', style: defaultTextStyle),
                  title: Text(item.name, style: defaultTextStyle),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      shoppingListState.deleteItem(item.id);
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FabWidget(shoppingListState: shoppingListState),
    );
  }
}
