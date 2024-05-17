   import 'package:flutter/material.dart';

class DoubleEditingController extends TextEditingController {
     @override
     set text(String newText) {
       if (newText.isEmpty || double.tryParse(newText) != null) {
         super.text = newText;
       }
     }
   }