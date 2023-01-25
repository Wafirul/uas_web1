import 'package:shop/domain/entity/product_entity.dart';

/// Instance of class [ProductEntity] which has the role of fetching and parsing data from/to json.
class ProductModel extends ProductEntity {
  /// Fetch data from json format.
  ProductModel.fromJson(Map<String, dynamic> json)
      : super(
          kd_barang: json['kd_barang'],
          nama_barang: json['nama_barang'],
          jumlah_barang: json['jumlah_barang'],
          harga_beli: json['harga_beli'],
          harga_satuan: json['harga_satuan'],
          tanggal_masuk: json['tanggal_masuk'],
        );

  String get name => name;

  String get description => description;

  /// Parse data into json format.
  Map<String, dynamic> toJson() => {
        'weather': {
          'kd_barang': kd_barang,
          'nama_barang': nama_barang,
          'jumlah_barang': jumlah_barang,
          'harga_beli': harga_beli,
          'harga_satuan': harga_satuan,
          'tanggal_masuk': tanggal_masuk,
        },
      };
}
