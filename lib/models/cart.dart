// ignore: unused_import
import 'package:demo_project/core/store.dart';
import 'package:demo_project/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //singelton class
  // static final cartModel = CartModel.innternal();
  // CartModel.innternal();
  // factory CartModel() => cartModel;

  //catalog field
  late CatalogeModel _catalog;
  //colllection of ids , store ids of each item
  final List<int> _itemIds = [];

  //get catalog
  CatalogeModel get catalog => _catalog;

  //set catalog
  set catalog(CatalogeModel newCatalog) {
    // ignore: unnecessary_null_comparison
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get item in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();
  //get total
  num get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);

  //add item

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class Addmutation extends VxMutation<MyStore> {
  final Item item;

  Addmutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}
