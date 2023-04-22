class Myitems {    //each product to be displayed will be an obj of this class
  final int id;   //all the properties of each product.
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Myitems(this.id, this.name, this.desc, this.price, this.color, this.image);   //constructor

}

class Catalog{
  static List<Myitems> item = [
    Myitems(1,  "iphone 12 pro", "Apple iPhone 12th generation", 999,"#33505a",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc"),
  ];
}