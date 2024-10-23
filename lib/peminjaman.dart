class Peminjaman {
  String kode;
  String nama;
  String kodePeminjaman;
  DateTime tanggal;
  String kodeNasabah;
  String namaNasabah;
  double jumlahPinjaman;
  int lamaPinjaman;
  late double bunga;

  Peminjaman({
    required this.kode,
    required this.nama,
    required this.kodePeminjaman,
    required this.tanggal,
    required this.kodeNasabah,
    required this.namaNasabah,
    required this.jumlahPinjaman,
    required this.lamaPinjaman,
  }) {
    bunga = 0.12 * jumlahPinjaman; //Menghitung bunga
  }

  double get angsuranPokok => jumlahPinjaman / lamaPinjaman;

  double get bungaPerBulan => bunga / 12;

  double get angsuranPerBulan => angsuranPokok + bungaPerBulan;

  double get totalHutang => jumlahPinjaman + bunga;
}
