import 'kendaraan.dart';
class Motor extends Kendaraan {
  String tipeMotor;
  double cc;

  Motor({
    required String merk,
    required String model,
    required int tahun,
    required double hargaSewa,
    required this.tipeMotor,
    required this.cc,
  }) : super(
          jenis: 'Motor',
          merk: merk,
          model: model,
          tahun: tahun,
          hargaSewa: hargaSewa,
        );

  @override
  void displayInfo() {
    super.displayInfo();
    print('Tipe: $tipeMotor, CC: $cc');
  }
}