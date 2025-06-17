import 'dart:io';
import 'kendaraan.dart';
import 'mobil.dart';
import 'motor.dart';
import 'bus.dart';
import 'transaksi.dart';

void main() {
  // Inisialisasi data kendaraan
  List<Kendaraan> daftarKendaraan = [
    Mobil(
      merk: 'Mobil Toyota',
      model: 'Avanza',
      tahun: 2020,
      hargaSewa: 300000,
      tipeTransmisi: 'Automatic',
      jumlahKursi: 7,
    ),
    Mobil(
      merk: 'Mobil Honda',
      model: 'Brio',
      tahun: 2021,
      hargaSewa: 250000,
      tipeTransmisi: 'Manual',
      jumlahKursi: 5,
    ),
    Motor(
      merk: 'Motor Yamaha',
      model: 'NMAX',
      tahun: 2022,
      hargaSewa: 150000,
      tipeMotor: 'Skuter',
      cc: 155,
    ),
    Motor(
      merk: 'Motor Honda',
      model: 'CBR150R',
      tahun: 2021,
      hargaSewa: 180000,
      tipeMotor: 'Sport',
      cc: 150,
    ),
    Bus(
      merk: 'Bus Mercedes',
      model: 'Pandawa 87',
      tahun: 2019,
      hargaSewa: 2500000,
      kapasitasPenumpang: 30,
      adaAC: true,
    ),
  ];

  // menginisiasi struktur data linked list untuk transaksi
  TransaksiLinkedList semuaTransaksi = TransaksiLinkedList();
  TransaksiStack transaksiTerbaru = TransaksiStack();

  // Menu utama
  bool jalankan = true;
  while (jalankan) {
    print('\n=== RENTALIN ===');
    print('1. Daftar Kendaraan');
    print('2. Transaksi Sewa');
    print('3. Daftar Penyewa');
    print('4. Keluar');
    stdout.write('Pilih menu: ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1': // Daftar Kendaraan
        bool kembali = false;
        while (!kembali) {
          print('\n=== Daftar Kendaraan ===');
          print('1. Semua Kendaraan');
          print('2. Daftar Mobil');
          print('3. Daftar Motor');
          print('4. Daftar Bus');
          print('5. Kembali ke Menu Utama');
          stdout.write('Pilih jenis daftar kendaraan: ');
          String? jenisInput = stdin.readLineSync();

          switch (jenisInput) {
            case '1': // Daftar semua Kendaraan
              print('\n=== Semua Kendaraan ===');
              for (int i = 0; i < daftarKendaraan.length; i++) {
                print('\nKendaraan ${i + 1}');
                daftarKendaraan[i].displayInfo();
              }
              break;
            
            case '2': // Daftar Mobil
              print('\n=== Daftar Mobil ===');
              int index = 1;
              for (var kendaraan in daftarKendaraan.where((k) => k.jenis == 'Mobil')) {
                print('\nMobil $index');
                kendaraan.displayInfo();
                index++;
              }
              break;
            
            case '3': // Daftar Motor
              print('\n=== Daftar Motor ===');
              int index = 1;
              for (var kendaraan in daftarKendaraan.where((k) => k.jenis == 'Motor')) {
                print('\nMotor $index');
                kendaraan.displayInfo();
                index++;
              }
              break;
            
            case '4': // Daftar Bus
              print('\n=== Daftar Bus ===');
              int index = 1;
              for (var kendaraan in daftarKendaraan.where((k) => k.jenis == 'Bus')) {
                print('\nBus $index');
                kendaraan.displayInfo();
                index++;
              }
              break;
            
            case '5': // Kembali
              kembali = true;
              break;
            
            default:
              print('Pilihan tidak valid!');
          }
        }
        break;

      case '2': // Transaksi Sewa
        print('\n=== Transaksi Sewa ===');
        
        // Pilih kendaraan
        print('\nDaftar Kendaraan Tersedia:');
        for (int i = 0; i < daftarKendaraan.length; i++) {
          print('${i + 1}. ${daftarKendaraan[i].jenis} - ${daftarKendaraan[i].merk} ${daftarKendaraan[i].model}');
        }
        
        stdout.write('Pilih kendaraan (1-${daftarKendaraan.length}): ');
        int? pilihan = int.tryParse(stdin.readLineSync() ?? '');
        
        if (pilihan == null || pilihan < 1 || pilihan > daftarKendaraan.length) {
          print('Pilihan tidak valid!');
          break;
        }
        
        Kendaraan kendaraanDipilih = daftarKendaraan[pilihan - 1];
        print('\nAnda memilih:');
        kendaraanDipilih.displayInfo();
        
        // Input data penyewa
        stdout.write('Nama Penyewa: ');
        String namaPenyewa = stdin.readLineSync() ?? 'Tanpa Nama';
        
        //input durasi sewa
        stdout.write('Durasi Sewa (hari): ');
        int? durasi = int.tryParse(stdin.readLineSync() ?? '');
        if (durasi == null || durasi < 1) {
          print('Durasi tidak valid, harap transaksi ulang!');
          break;
        }
        
        // Buat transaksi
        Transaksi transaksiBaru = Transaksi(
          kendaraan: kendaraanDipilih,
          namaPenyewa: namaPenyewa,
          tanggalSewa: DateTime.now(),
          durasiHari: durasi,
        );

        // untuk Simpan transaksi
        semuaTransaksi.add(transaksiBaru);
        transaksiTerbaru.push(transaksiBaru);
        
        print('\nTransaksi berhasil!');
        transaksiBaru.displayInfo();
        break;

      case '3': // Daftar Penyewa
        print('\n=== Daftar Penyewa ===');
        print('1. Semua Transaksi');
        print('2. Transaksi Terakhir');
        stdout.write('Pilih opsi: ');
        String? subInput = stdin.readLineSync();
        
        if (subInput == '1') {
          print('\n=== Semua Transaksi ===');
          semuaTransaksi.printDisplay();
        } else if (subInput == '2') {
          transaksiTerbaru.displayRecent();
        } else {
          print('Pilihan tidak valid!');
        }
        break;

      case '4': // Keluar
        jalankan = false;
        print('Terima kasih telah menggunakan Rentalin!');
        break;

      default:
        print('Pilihan tidak valid!');
    }
  }
}