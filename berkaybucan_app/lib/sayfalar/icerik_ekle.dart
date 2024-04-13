import 'package:berkaybucan_app/models/Blog.dart';
import 'package:flutter/material.dart';

import '../models/ApiServices.dart';

class IcerikEkle extends StatefulWidget {
  IcerikEkle({super.key});
  late List<Blog> __blgList;
  IcerikEkle.parametreli(this.__blgList);

  @override
  State<IcerikEkle> createState() => _IcerikEkleState();
}

class _IcerikEkleState extends State<IcerikEkle> {
  String baslik = "", icerik = "", tarih = "", olusturan = "", kapakurl = "";
  var formkey = GlobalKey<FormState>();
  Blog newBlg = Blog.free();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Blog Yazısı Ekle - Türkiye Kripto")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Yazı Başlığı",
                      hintText: "Yazı Başlığını giriniz."),
                  onSaved: (girilen) {
                    newBlg.BlogBaslik = girilen!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Yazıyı Oluşturan",
                      hintText: "Yazıyı Oluşturanı giriniz."),
                  onSaved: (girilen) {
                    newBlg.BlogOlusturan = girilen!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Yazı Tarihi",
                      hintText: "Yazı Tarihini giriniz."),
                  onSaved: (girilen) {
                    newBlg.BlogTarih = girilen!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "İcerik", hintText: "İçeriği giriniz."),
                  onSaved: (girilen) {
                    newBlg.BlogIcerik = girilen!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Kapak URL",
                      hintText: "Kapak urlsini giriniz."),
                  onSaved: (girilen) {
                    newBlg.BlogKapakUrl = girilen!;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            formkey.currentState!.save();
                            ApiServices.BlogEkle(newBlg);
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text("Kaydet")),
                    SizedBox(
                      width: 25,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("İptal")),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
