import 'package:projone/Catalog.dart';

class CartModel {
  // cartmodel

  // static final CartModel _singleton = CartModel._internal();    //making cartmodel a singleton class
  //
  // factory CartModel() {
  //   return _singleton;
  // }
  //
  // CartModel._internal();

  late Catalog
      _catalog; //late is a keyword by which u promise dart that u will initialise this _catalog later , this happens due to null safety.

  final List<int> _itemids = []; // collection of ids in cart

  Catalog get catalog => _catalog; //getter to get _catalog

  void set catalog(Catalog c) //setter
  {
    assert(c != null); //making sure c is not null
    _catalog = c;
  }

  List get cartitems => _itemids.map((id) => _catalog.getbyId(id)).toList();

  //map those elements where itemids[id] == _catalog(id) and make them into a list

  num totalPrice() {
    //returns totoal price of all cart items
    num totalp = cartitems.fold(0, (total, current) => total + current.price);
    return totalp;
  }

  //add item
  void add(Myitems item) {
    _itemids.add(item.id);
  }

//remove item
  void remove(Myitems item) {
    _itemids.remove(item.id);
  }
}
