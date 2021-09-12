import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'product.g.dart';

// ProductMaster productMasterFromMap(String str) =>
//     ProductMaster.fromMap(json.decode(str));

// String productMasterToMap(ProductMaster data) => json.encode(data.toMap());

@HiveType(typeId: 0)
class ProductMaster extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? date;
  @HiveField(3)
  String? total;
  @HiveField(4)
  List<ProductIkan> productikan;



  ProductMaster(this.date, this.name, this.productikan): this.id = Uuid().v1();

  // factory ProductMaster.fromMap(Map<String, dynamic> json) => ProductMaster(
  //       name: json["name"],
  //       date: json["date"],
  //       totalkeseluruhan: json["totalkeseluruhan"],
  //       productikan: List<ProductIkan>.from(
  //           json["product"].map((x) => ProductIkan.fromJson(x))),
  //     );

  // Map<String, dynamic> toMap() => {
  //       "name": name,
  //       "date": date,
  //       "totalkeseluruhan": totalkeseluruhan,
  //       "product": List<dynamic>.from(productikan!.map((x) => x.toMap())),
  //     };
}
@HiveType(typeId: 1)
class ProductIkan {
  ProductIkan(
    this.date,
    this.jenisikan,
    this.satuan,
    this.hargasatuan,
    this.jumlah,
    this.total,
  );
  @HiveField(0)
  String? date;
  @HiveField(1)
  String? jenisikan;
  @HiveField(2)
  String? satuan;
  @HiveField(3)
  String? hargasatuan;
  @HiveField(4)
  String? jumlah;
  @HiveField(5)
  String? total;

  // ProductIkan.fromJson(Map<String, dynamic> json) {
  //   date = json['date'];
  //   jenisikan = json['jenisikan'];
  //   satuan = json['satuan'];
  //   hargasatuan = json['hargasatuan'];
  //   jumlah = json['jumlah'];
  //   total = json['total'];
  // }

  // Map<String, dynamic> toMap() => {
  //       "date":date,
  //       "jenisikan": jenisikan,
  //       "satuan": satuan,
  //       "hargasatuan": hargasatuan,
  //       "jumlah": jumlah,
  //       "total": total,
  //     };
}
