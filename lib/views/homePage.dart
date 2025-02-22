import 'package:architecture/models/product.dart';
import 'package:architecture/widgets/product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../viewModel/controllers/product_controller.dart';

class HomePage extends StatelessWidget {

  //final ProductController productController = Get.put(ProductController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;

      return Scaffold(
        body:Container(
           width:size.width,
            height:size.height,
            decoration:BoxDecoration(
              color:Colors.blue
            ),
            child:Center(
              child:Text(
                "0",
                style:TextStyle(
                  fontSize: 35,
                  color:Colors.white,
                  fontWeight:FontWeight.bold,
                )
              ),
            )
        ),
      );
  }

  // @override
  // Widget build(BuildContext context) {
  //   Size size = MediaQuery.of(context).size;
  //   return Scaffold(
  //       appBar:PreferredSize(
  //           preferredSize:const Size.fromHeight(100),
  //           child:Container(
  //             width:size.width,
  //             height:100,
  //             color:Colors.blue,
  //           )
  //       ),
  //      body: Obx(()
  //        => Column(
  //          children:[
  //             const Padding(
  //                 padding:EdgeInsets.all(10),
  //                 child:Row(
  //                   children:[
  //                      // Expanded(child: child),
  //                      // IconButton(onPressed: onPressed, icon: icon),
  //                      // IconButton(onPressed: onPressed, icon: icon)
  //                   ],
  //                 ),
  //             ),
  //             Expanded(
  //               child:GridView.builder(
  //                     itemCount:productController.listOfProducts.length,
  //                     itemBuilder:(context,index){
  //                              Product prod = productController.listOfProducts[index];
  //                              return Container(
  //                                height:200,
  //                                width:200,
  //                                color:Colors.blue,
  //                                margin:const EdgeInsets.only(bottom:10.0),
  //                                child:ProductTile(product:prod),
  //                              );
  //                   }, gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
  //                   crossAxisCount:2,
  //                   crossAxisSpacing:10,
  //                   childAspectRatio:1.0
  //               ),
  //               ),
  //             )
  //          ],
  //        ),
  //      ),
  //   );
  // }


}
