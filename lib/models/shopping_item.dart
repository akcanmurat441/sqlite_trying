class ShoppingItem {
  final int id;
  final String name;

  ShoppingItem({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }
}
