class Item {
  int id;
  String name;
  String description;
  String image;
  int price;
  String status;
  int likes;
  Map<String, int> spec;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.status,
      required this.spec,
      required this.likes});
}
