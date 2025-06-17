// Kelas abstrak untuk kendaraan
abstract class Kendaraan {
  String jenis;
  String merk;
  String model;
  int tahun;
  double hargaSewa;

  Kendaraan({
    required this.jenis,
    required this.merk,
    required this.model,
    required this.tahun,
    required this.hargaSewa,
  });

  void displayInfo() {
    print('$merk $model ($tahun) - Rp${hargaSewa}/hari');
  }
}