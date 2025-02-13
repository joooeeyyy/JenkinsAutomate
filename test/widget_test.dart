import 'package:architecture/models/product.dart';
import 'package:architecture/viewModel/data_layer/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:build_runner/build_runner.dart';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'widget_test.mocks.dart';


@GenerateMocks([http.Client])
void main() {

  WidgetsFlutterBinding.ensureInitialized();
  //#1 Evaluate the code
  //#2 Write Group Test
  group('fetchProductsService',(){
    test("successfully returned product object",()async{
          final client = MockClient();
          when(client.get(Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline")))
              .thenAnswer((_) async =>
          http.Response('[{"id":495,"brand": "maybelline", "name": "Maybelline Face Studio Master Hi-Light Light Booster Bronzer", "price": "14.99", "price_sign": null, "currency": null,"image_link": "https://d3t32hsnjxo7q6.cloudfront.net/i/991799d3e70b8856686979f8ff6dcfe0_ra,w158,h184_pa,w158,h184.png","product_link": "https://well.ca/products/maybelline-face-studio-master_88837.html","website_link": "https://well.ca","description": "Maybelline Face Studio Master Hi-Light Light Boosting bronzer formula has an expert \nbalance of shade + shimmer illuminator for natural glow. Skin goes \nsoft-lit with zero glitz.\n\n\t\tFor Best Results: Brush over all shades in palette and gently sweep over \ncheekbones, brow bones, and temples, or anywhere light naturally touches\n the face.\n\n\t\t\n\t\n\n                    ","rating": 5.0,"category": null,"product_type": "bronzer","tag_list": [],"created_at": "2016-10-01T18:36:15.012Z","updated_at": "2017-12-23T21:08:50.624Z","product_api_url": "https://makeup-api.herokuapp.com/api/v1/products/495.json","api_featured_image": "//s3.amazonaws.com/donovanbailey/products/api_featured_images/000/000/495/original/open-uri20171223-4-9hrto4?1514063330","product_colors":[]}]',200));
   
           expect(await RemoteServices.fetchProductsService(client:client) , isA<List<Product>>());
    });

    test("test failed with an exception returned" , () async {
      final client = MockClient();
       when(client.get(Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"))).thenAnswer((_)
       async => http.Response("Not Found",404));

       expect(await RemoteServices.fetchProductsService(client: client), throwsException);
    });

  });


  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

}
