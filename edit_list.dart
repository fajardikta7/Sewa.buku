import 'package:flutter/material.dart';

class EditList extends StatefulWidget {
  final String oldbuku;
  final String oldhari;
  final String oldkategori;

  const EditList({Key key, this.oldbuku, this.oldhari, this.oldkategori})
      : super(key: key);

  @override
  _EditListState createState() => _EditListState();
}

class _EditListState extends State<EditList> {
  TextEditingController txtbuku;
  TextEditingController haritxt;

  String _buku;
  String odl;
  void oldData() {
    txtbuku = TextEditingController(text: widget.oldbuku);
    haritxt = TextEditingController(text: widget.oldhari);

    odl = widget.oldkategori;
  }

  List _kategori = [
    " Fisika",
    " Kimia",
    "Teknologi Informasi ",
    " Astronomi",
    " Sejarah",
    " B Inggris",
    " Proposal IT "
  ];

  void simpanData() {
    Navigator.pop(context, {
      'buku': txtbuku.text,
      'hari': haritxt.text,
      'kategori': _buku == null ? odl : _buku
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oldData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          children: [
            TextField(
              controller: haritxt,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  hintText: "jumlah hari",
                  labelText: "sewa hari",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0))),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            TextField(
              controller: txtbuku,
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
                  hint: Text((odl == null) ? 'Pilih' : '$odl'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    simpanData();
                  },
                  child: Text('Simpan'),
                ),
                RaisedButton(
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
