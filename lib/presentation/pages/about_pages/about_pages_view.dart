import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Tentang Aplikasi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Aplikasi untu mencari informasi yang berkaitan dengan kesehatan penerima fasilitas kesehatan penerima BPJS kesehatan, pencarian lokasi faskes yang bekerja sama dengan BPJS Kesehatan dan mengarahkan lokasi langsung ke peta (Google Maps).',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
