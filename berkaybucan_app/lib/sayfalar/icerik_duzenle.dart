import 'package:berkaybucan_app/models/Blog.dart';
import 'package:flutter/material.dart';
import '../models/ApiServices.dart';

class IcerikDuzenle extends StatefulWidget {
  IcerikDuzenle({super.key});
  late Blog _duzenlenecekIcerik;
  IcerikDuzenle.parametreli(this._duzenlenecekIcerik);

  @override
  State<IcerikDuzenle> createState() => _IcerikDuzenleState();
}

class _IcerikDuzenleState extends State<IcerikDuzenle> {
  var formkey = GlobalKey<FormState>();
  late TextEditingController baslikCtrl,
      icerikCtrl,
      tarihCtrl,
      urlCtrl,
      olusturanCtrl;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    baslikCtrl =
        TextEditingController(text: widget._duzenlenecekIcerik.BlogBaslik);
    icerikCtrl =
        TextEditingController(text: widget._duzenlenecekIcerik.BlogIcerik);
    tarihCtrl =
        TextEditingController(text: widget._duzenlenecekIcerik.BlogTarih);
    urlCtrl =
        TextEditingController(text: widget._duzenlenecekIcerik.BlogKapakUrl);
    olusturanCtrl =
        TextEditingController(text: widget._duzenlenecekIcerik.BlogOlusturan);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    baslikCtrl.dispose();
    icerikCtrl.dispose();
    tarihCtrl.dispose();
    urlCtrl.dispose();
    olusturanCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icerik Duzenleme - Turkiye Kripto"),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: baslikCtrl,
                    decoration: InputDecoration(
                        labelText: "Yazı Başlığı",
                        hintText: "Yazı Başlığını giriniz."),
                    onSaved: (girilen) {
                      widget._duzenlenecekIcerik.BlogBaslik = girilen!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: olusturanCtrl,
                    decoration: InputDecoration(
                        labelText: "Yazıyı Oluşturan",
                        hintText: "Yazıyı Oluşturanı giriniz."),
                    onSaved: (girilen) {
                      widget._duzenlenecekIcerik.BlogOlusturan = girilen!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: tarihCtrl,
                    decoration: InputDecoration(
                        labelText: "Yazı Tarihi",
                        hintText: "Yazı Tarihini giriniz."),
                    onSaved: (girilen) {
                      widget._duzenlenecekIcerik.BlogTarih = girilen!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: icerikCtrl,
                    decoration: InputDecoration(
                        labelText: "İcerik", hintText: "İçeriği giriniz."),
                    onSaved: (girilen) {
                      widget._duzenlenecekIcerik.BlogIcerik = girilen!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: urlCtrl,
                    decoration: InputDecoration(
                        labelText: "Kapak URL",
                        hintText: "Kapak urlsini giriniz."),
                    onSaved: (girilen) {
                      widget._duzenlenecekIcerik.BlogKapakUrl = girilen!;
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
                              ApiServices.IcerikGuncelle(
                                  widget._duzenlenecekIcerik);
                              Navigator.of(context).pop();
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
              ))),
    );
  }
}
