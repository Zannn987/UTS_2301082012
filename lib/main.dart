import 'package:flutter/material.dart';
import 'package:flutter_uts_2301082012_b/peminjaman.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peminjaman App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Peminjaman'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PeminjamanPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Selamat datang di Aplikasi Peminjaman!'),
      ),
    );
  }
}

class PeminjamanPage extends StatelessWidget {
  final Peminjaman peminjaman = Peminjaman(
    kode: '001',
    nama: 'Peminjaman Uang',
    kodePeminjaman: 'KP001',
    tanggal: DateTime.now(),
    kodeNasabah: 'N001',
    namaNasabah: 'Maulana Hazanni Akbar',
    jumlahPinjaman: 1000000.0,
    lamaPinjaman: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Peminjaman'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kode Peminjaman: ${peminjaman.kodePeminjaman}'),
            Text('Nama Nasabah: ${peminjaman.namaNasabah}'),
            Text('Jumlah Pinjaman: ${peminjaman.jumlahPinjaman}'),
            Text('Lama Pinjaman: ${peminjaman.lamaPinjaman} bulan'),
            Text('Bunga Total: ${peminjaman.bunga}'),
            Text('Angsuran Pokok: ${peminjaman.angsuranPokok}'),
            Text('Bunga Per Bulan: ${peminjaman.bungaPerBulan}'),
            Text('Angsuran Per Bulan: ${peminjaman.angsuranPerBulan}'),
            Text('Total Hutang: ${peminjaman.totalHutang}'),
          ],
        ),
      ),
    );
  }
}
