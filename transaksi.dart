import 'kendaraan.dart';
// Kelas untuk Transaksi
class Transaksi {
  Kendaraan kendaraan;
  String namaPenyewa;
  DateTime tanggalSewa;
  int durasiHari;
  double totalBiaya;

  Transaksi({
    required this.kendaraan,
    required this.namaPenyewa,
    required this.tanggalSewa,
    required this.durasiHari,
  }) : totalBiaya = kendaraan.hargaSewa * durasiHari;

  void displayInfo() {
    print('=== Detail Transaksi ===');
    print('Nama Penyewa: $namaPenyewa');
    print('Tanggal Sewa: ${tanggalSewa.day}/${tanggalSewa.month}/${tanggalSewa.year}');
    print('Durasi: $durasiHari hari');
    print('Total Biaya: Rp$totalBiaya');
    print('\nKendaraan : ');
    kendaraan.displayInfo();
  }
}

// Node untuk LinkedList
class ListNode {
  Transaksi data;
  ListNode? next;

  ListNode(this.data);
}

// LinkedList untuk menyimpan transaksi
class TransaksiLinkedList {
  ListNode? head;
  int length = 0;

  void add(Transaksi transaksi) {
    ListNode newNode = ListNode(transaksi);
    if (head == null) {
      head = newNode;
    } else {
      ListNode? current = head;
      while (current?.next != null) {
        current = current?.next;
      }
      current?.next = newNode;
    }
    length++;
  }

  void printDisplay() {
    if (head == null) {
      print('Belum ada transaksi.');
      return;
    }

    ListNode? current = head;
    int index = 1;
    while (current != null) {
      print('\nTransaksi $index');
      current.data.displayInfo();
      current = current.next;
      index++;
    }
  }
}

// Stack untuk riwayat transaksi terbaru
class TransaksiStack {
  List<Transaksi> _transactions = [];

  void push(Transaksi transaksi) {
    _transactions.add(transaksi);
  }

  Transaksi? pop() {
    if (_transactions.isEmpty) return null;
    return _transactions.removeLast();
  }

  void displayRecent() {
    if (_transactions.isEmpty) {
      print('Belum ada transaksi.');
      return;
    }

    print('=== 5 Transaksi Terakhir ===');
    int start = _transactions.length > 5 ? _transactions.length - 5 : 0;
    for (int i = start; i < _transactions.length; i++) {
      print('\nTransaksi ${i + 1}');
      _transactions[i].displayInfo();
    }
  }
}