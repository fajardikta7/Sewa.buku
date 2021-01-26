import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class TambahData extends StatefulWidget {
  @override
  _TambahDataState createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  TextEditingController txtNama = TextEditingController();
  TextEditingController absentxt = TextEditingController();
  String _buku;
  List _kategori = [
    " Fisika",
    " Kimia",
    "Teknologi Informasi ",
    " Astronomi",
    " Sejarah",
    " B Inggris",
    " Proposal IT "
  ];
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void simpanData() {
    Navigator.pop(context, {
      'buku': txtNama.text,
      'hari': absentxt.text,
      'kategori': _buku != null ? _buku : ' Kosong'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Perpustakaan"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
          Radius.circular(15),
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            TextField(
              controller: absentxt,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  hintText: "jumlah hari",
                  labelText: "sewa hari",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  )),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            TextField(
              controller: txtNama,
              decoration: new InputDecoration(
                  hintText: "buku",
                  labelText: "judul buku",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0))),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            Row(
              children: <Widget>[
                new Text(
                  "Kategori   : ",
                  style: new TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
                DropdownButton(
                  items: _kategori.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _buku = value;
                    });
                  },
                  value: _buku,
                  hint: Text('Pilih'),
                ),
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 35.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.greenAccent,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                  child: Text("Simpan"),
                  onPressed: () {
                    simpanData();
                  },
                ),
                RaisedButton(
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Batal'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
