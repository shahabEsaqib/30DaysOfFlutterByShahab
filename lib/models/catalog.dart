class CatalogeModel {
  static final items = [
    Item(
        id: 1,
        name: "Iphone 12 pro",
        desc: "Apple Iphone 12th generation ",
        price: 999,
        color: "#33505a",
        image:
            "https://www.mytrendyphone.eu/images/iPhone-12-Pro-Max-128GB-Graphite-0194252021200-25102020-1-p.jpg")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
