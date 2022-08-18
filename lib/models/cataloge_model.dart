class CatalogModel {
  static List<Item> items = [
    Item(
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc")
  ];
}

class Item {
  final String name;
  final String desc;
  final num price;

  final String image;

  Item(
      {required this.name,
      required this.desc,
      required this.price,
      required this.image});

  factory Item.fromMap(Map<dynamic, dynamic> map) {
    return Item(
      desc: map["desc"],
      image: map["image"],
      name: map["name"],
      price: map["price"],
    );
  }

  toMap() => {
        "name": name,
        "desc": desc,
        "price": price,
        "image": image,
      };
}
