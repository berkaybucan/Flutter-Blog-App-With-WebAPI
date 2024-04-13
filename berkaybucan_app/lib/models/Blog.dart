class Blog {
  int blogId = -1;
  String BlogBaslik = "";
  String BlogOlusturan = "";
  String BlogTarih = "";
  String BlogKapakUrl = "";
  String BlogIcerik = "";
  Blog.free();
  Blog({
    required this.blogId,
    required this.BlogBaslik,
    required this.BlogOlusturan,
    required this.BlogTarih,
    required this.BlogKapakUrl,
    required this.BlogIcerik,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      blogId: json['blogId'],
      BlogBaslik: json['blogBaslik'],
      BlogOlusturan: json['blogOlusturan'],
      BlogTarih: json['blogTarih'],
      BlogKapakUrl: json['blogKapakUrl'],
      BlogIcerik: json['blogIcerik'],
    );
  }
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["blogId"] = this.blogId;
    map["blogBaslik"] = this.BlogBaslik;
    map["blogOlusturan"] = this.BlogOlusturan;
    map["blogTarih"] = this.BlogTarih;
    map["blogKapakUrl"] = this.BlogKapakUrl;
    map["blogIcerik"] = this.BlogIcerik;
    return map;
  }
}
