import 'kendaraan.dart';

class Bus extends Kendaraan {
  int kapasitasPenumpang;
  bool adaAC;

  Bus({
    required String merk,
    required String model,
    required int tahun,
    required double hargaSewa,
    required this.kapasitasPenumpang,
    required this.adaAC,
  }) : super(
          jenis: 'Bus',
          merk: merk,
          model: model,
          tahun: tahun,
          hargaSewa: hargaSewa,
        );

  @override
  void displayInfo() {
    super.displayInfo();
    print('Kapasitas: $kapasitasPenumpang, AC: ${adaAC ? "Ya" : "Tidak"}');
  }
}