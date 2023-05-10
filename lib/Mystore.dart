import 'package:projone/Cartmodel.dart';
import 'package:projone/Catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class Mystore extends VxStore{    //to make this work make all the required stateful widgets stateless . Mystore is basically a store by Velocity which stores all data
  late Catalog catalog ;
  late CartModel cartModel;

  Mystore()
  {
    catalog = Catalog();
    cartModel = CartModel();
    cartModel.catalog = catalog;

  }
}