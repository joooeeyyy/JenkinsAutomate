import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/views/homePage.dart';



void main(){
  
  testWidgets("Check if text on the screen is 0",(tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));
      final ctr =  find.text("0");
      expect(ctr,findsOneWidget);
  });

}
