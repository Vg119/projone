class Myitems {
  //each product to be displayed will be an obj of this class
  final int id; //all the properties of each product.
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Myitems(this.id, this.name, this.desc, this.price, this.color,
      this.image); //constructor

  factory Myitems.fromMap(
      Map<String, dynamic>
          map) // factory constructor which returns a Myitem obj after putting the reqd values in reqd variables.
  {
    return Myitems(map["id"], map["name"], map["desc"], map["price"],
        map["color"], map["image"]);
  }

  toMap() => //returns a map made of the variables of Myitems obj.
      {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}

class Catalog {
  // static final Catalog _singleton = Catalog._internal();    //making cartmodel a singleton class
  //
  // factory Catalog() {
  //   return _singleton;
  // }
  //
  // Catalog._internal();
  static List<Myitems> item = []; //list of items

  Myitems getbyId(int id) //returns element by id
  {
    Myitems a = item.firstWhere((element) => element.id == id,
        orElse:
            null); //returns first element that matches the condition , if not present assigns null
    if (a == null) throw Exception("element not present");
    return a;
  }

  Myitems getbyPos(int pos) => item[pos]; //return the pos th item in list.
}
