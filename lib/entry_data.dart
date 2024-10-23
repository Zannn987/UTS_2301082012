import 'package:flutter/material.dart';
import 'peminjaman.dart';

class EntryForm extends StatefulWidget {
  const EntryForm({super.key});

  @override
  _EntryFormState createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final _formKey = GlobalKey<FormState>();
  late Peminjaman _peminjaman;

  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kodePeminjamanController =
      TextEditingController();
  final TextEditingController _jumlahPinjamanController =
      TextEditingController();
  final TextEditingController _lamaPinjamanController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _peminjaman = Peminjaman(
      kode: '',
      nama: '',
      kodePeminjaman: '',
      tanggal: DateTime.now(),
      kodeNasabah: '',
      namaNasabah: '',
      jumlahPinjaman: 0.0,
      lamaPinjaman: 0,
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Simpan data
      _formKey.currentState!.save();
      // Navigasi kembali ke halaman sebelumnya
      Navigator.pop(context, _peminjaman);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Peminjaman'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _kodeController,
                decoration: const InputDecoration(labelText: 'Kode'),
                validator: (value) =>
                    value!.isEmpty ? 'Harap masukkan kode' : null,
                onSaved: (value) => _peminjaman.kode = value!,
              ),
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (value) =>
                    value!.isEmpty ? 'Harap masukkan nama' : null,
                onSaved: (value) => _peminjaman.nama = value!,
              ),
              TextFormField(
                controller: _kodePeminjamanController,
                decoration: const InputDecoration(labelText: 'Kode Peminjaman'),
                validator: (value) =>
                    value!.isEmpty ? 'Harap masukkan kode peminjaman' : null,
                onSaved: (value) => _peminjaman.kodePeminjaman = value!,
              ),
              TextFormField(
                controller: _jumlahPinjamanController,
                decoration: const InputDecoration(labelText: 'Jumlah Pinjaman'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Harap masukkan jumlah pinjaman' : null,
                onSaved: (value) =>
                    _peminjaman.jumlahPinjaman = double.parse(value!),
              ),
              TextFormField(
                controller: _lamaPinjamanController,
                decoration:
                    const InputDecoration(labelText: 'Lama Pinjaman (bulan)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Harap masukkan lama pinjaman' : null,
                onSaved: (value) =>
                    _peminjaman.lamaPinjaman = int.parse(value!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
