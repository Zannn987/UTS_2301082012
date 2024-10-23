import 'package:flutter/material.dart';
import 'peminjaman.dart';
import 'entry_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Peminjaman> peminjamanList = [];

  void _addPeminjaman(Peminjaman peminjaman) {
    setState(() {
      peminjamanList.add(peminjaman);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Tambah Peminjaman'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EntryForm()),
                ).then((value) {
                  if (value is Peminjaman) {
                    _addPeminjaman(value);
                    // Tampilkan notifikasi atau dialog jika perlu
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Peminjaman baru ditambahkan: ${value.kode}')),
                    );
                  }
                });
              },
            ),
            ListTile(
              title: const Text('Lihat Peminjaman'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PeminjamanListPage(peminjamanList: peminjamanList)),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Selamat datang di Aplikasi Peminjaman!'),
      ),
    );
  }
}

class PeminjamanListPage extends StatelessWidget {
  final List<Peminjaman> peminjamanList;

  const PeminjamanListPage({super.key, required this.peminjamanList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Peminjaman'),
      ),
      body: ListView.builder(
        itemCount: peminjamanList.length,
        itemBuilder: (context, index) {
          final peminjaman = peminjamanList[index];
          return ListTile(
            title: Text('Kode: ${peminjaman.kodePeminjaman}'),
            subtitle: Text(
                'Nama Nasabah: ${peminjaman.namaNasabah}\nJumlah Pinjaman: ${peminjaman.jumlahPinjaman}'),
            onTap: () {
              // Tampilkan detail peminjaman atau tindakan lain
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Detail Peminjaman'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Kode Peminjaman: ${peminjaman.kodePeminjaman}'),
                      Text('Nama Nasabah: ${peminjaman.namaNasabah}'),
                      Text('Jumlah Pinjaman: ${peminjaman.jumlahPinjaman}'),
                      Text('Lama Pinjaman: ${peminjaman.lamaPinjaman} bulan'),
                      Text('Bunga Total: ${peminjaman.bunga}'),
                      Text('Angsuran Pokok: ${peminjaman.angsuranPokok}'),
                      Text('Bunga Per Bulan: ${peminjaman.bungaPerBulan}'),
                      Text(
                          'Angsuran Per Bulan: ${peminjaman.angsuranPerBulan}'),
                      Text('Total Hutang: ${peminjaman.totalHutang}'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Tutup'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
