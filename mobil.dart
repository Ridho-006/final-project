import 'kendaraan.dart';
class Mobil extends Kendaraan {
  String tipeTransmisi;
  int jumlahKursi;

  Mobil({
    required String merk,
    required String model,
    required int tahun,
    required double hargaSewa,
    required this.tipeTransmisi,
    required this.jumlahKursi,
  }) : super(
          jenis: 'Mobil',
          merk: merk,
          model: model,
          tahun: tahun,
          hargaSewa: hargaSewa,
        );

  @override
  void displayInfo() {
    super.displayInfo();
    print('Transmisi: $tipeTransmisi, Kursi: $jumlahKursi');
  }
}