import 'package:berkaybucan_app/models/ApiServices.dart';
import 'package:berkaybucan_app/sayfalar/icerik_ekle.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import '../models/Blog.dart';
import 'IcerikSayfasi.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  List<Blog> blogPosts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ApiServices.BlogListele().then((response) {
      var listeJson = json.decode(response) as List;

      blogPosts = listeJson.map((model) {
        return Blog.fromJson(model);
      }).toList();
    }).whenComplete(() {
      isLoading = false;
      setState(() {});
    });

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', fit: BoxFit.cover),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return IcerikEkle.parametreli(blogPosts);
              })).whenComplete(() {
                setState(() {});
              });
            },
            label: Text(
              "Yazı Ekle",
              style: TextStyle(
                color: Colors.green,
                fontSize: 30,
              ),
            ),
            icon: Icon(
              Icons.add,
              color: Colors.green,
            ),
          )
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: blogPosts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IcerikSayfasi(blogPosts[index]),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          blogPosts[index].BlogKapakUrl,
                          height: 200,
                          fit: BoxFit.cover,
                          frameBuilder: (_, image, loadingBuilder, __) {
                            if (loadingBuilder == null) {
                              return const SizedBox(
                                height: 200,
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            }
                            return image;
                          },
                          loadingBuilder: (BuildContext context, Widget image,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return image;
                            return SizedBox(
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (_, __, ___) => Image.asset(
                            "assets/otomatikGorsel.png",
                            height: 200,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                blogPosts[index].BlogBaslik,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Oluşturan ${blogPosts[index].BlogOlusturan} - ${blogPosts[index].BlogTarih}',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
