
import 'package:architecture/models/product.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {

  final Product product;

  const ProductTile({super.key,required this.product});

  @override
  Widget build(BuildContext context) {

    return Card(
      key:key,
      elevation:2,
      child:Padding(
          padding:const EdgeInsets.all(8),
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:[
              Flexible(
                flex:1,
                child: Stack(
                  children:[
                    Container(
                      height:180,
                      width:double.infinity,
                      clipBehavior:Clip.antiAlias,
                      decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(4)
                      ),
                      child: Image.network(product.imageLink!),
                    )
                  ],
                ),
              )

            ],
          ),
      ),
    );

  }


}
