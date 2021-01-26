import 'dart:io';

import 'package:flutter/material.dart';

class ReadData extends StatelessWidget {
  final String rbuku;
  final String rhari;
  final String rKategori;
  final File gambar;

  const ReadData({Key key, this.rbuku, this.rhari, this.rKategori, this.gambar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("buku"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: gambar == null
                    ? Text('No image selected.')
                    : Image.file(
                        gambar,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Text('judul buku : ' +
                rbuku +
                ' jumlah hari  : ' +
                rhari +
                ' Kategori : ' +
                rKategori),
          ],
        ),
      ),
    );
  }
}
