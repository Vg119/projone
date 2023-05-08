import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projone/widgets/homepage2classes/Homedetailpage.dart';

import '../../Catalog.dart';
import '../../pages/Homepage2.dart';
import 'Catalogitem.dart';

class CatalogList extends StatelessWidget {       //makes the list of elements
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: Catalog.item.length,
          itemBuilder: (context,index){
            final catalogitem = Catalog.item[index]; // Catalog.getbyPos(index) , this also does the same thing
            return InkWell(      //when u taap upon an item this opens homedetailpage
                 onTap: () => Navigator.push(context,
                     MaterialPageRoute(
                       builder: (context) =>
                         Homedetailpage(item: catalogitem),)),
                child: Catalogitem(item :catalogitem));
                                                         //passes item to Catalogitem to build the item to be displayed on list
          }),
    );
  }
}