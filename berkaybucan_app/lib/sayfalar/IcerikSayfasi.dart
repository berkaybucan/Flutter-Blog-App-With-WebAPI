import 'package:flutter/material.dart';
import '../models/ApiServices.dart';
import '../models/Blog.dart';
import 'icerik_duzenle.dart';

class IcerikSayfasi extends StatelessWidget {
  final Blog blogPost;

  IcerikSayfasi(this.blogPost);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blogPost.BlogBaslik),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return IcerikDuzenle.parametreli(blogPost);
              })).whenComplete(() {});
            },
            label: Text(
              "Düzenle",
              style: TextStyle(color: Colors.amber),
            ),
            icon: Icon(
              Icons.ads_click,
              color: Colors.amber,
            ),
          ),
          TextButton.icon(
            onPressed: () {
              var alert = AlertDialog(
                title: Text("Blog Silme Onayı"),
                content: Text(
                    "${blogPost.BlogBaslik} başlıklı blogu silmeyi onaylıyor musunuz ?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        ApiServices.IcerikSil(blogPost);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Text("Evet")),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Hayır")),
                ],
              );
              showDialog(
                  context: context,
                  builder: (context) {
                    return alert;
                  }).whenComplete(() {});
            },
            label: Text(
              "Sil",
              style: TextStyle(color: Colors.red),
            ),
            icon: Icon(
              Icons.remove,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                blogPost.BlogKapakUrl,
                height: 200,
                fit: BoxFit.cover,
                frameBuilder: (_, image, loadingBuilder, __) {
                  if (loadingBuilder == null) {
                    return const SizedBox(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()),
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
                        value: loadingProgress.expectedTotalBytes != null
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
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.0),
                  Text(
                    'Oluşturan ${blogPost.BlogOlusturan} - ${blogPost.BlogTarih}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    blogPost.BlogIcerik,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
