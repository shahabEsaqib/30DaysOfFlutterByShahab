class Items {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Items(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

final products = [
  Items(
      id: "shahab01",
      name: "Iphone 12",
      desc: "8 gb ram ",
      price: 999,
      color: "#33505a",
      image: "https://miro.medium.com/fit/c/262/262/0*X8c_x0DHBKxwfDM9")
];
