import 'dart:convert';

import 'package:berkaybucan_app/sayfalar/anasayfa.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/Blog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Türkiye Kripto',
      theme: ThemeData.dark(),
      home: Anasayfa(),
    );
  }
}
