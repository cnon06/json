import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled6/Mesajlar.dart';
import 'package:untitled6/kisiler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  void mesajParse ()
  {


    String strVeri = '{"mesajlar" : { "mesaj_kod": 1, "mesaj_icerik" : "başarılı"}} ';


    String strVeri2 = '{"kisiler" : [ {"kisi_id": "1", "kisi_ad" : "Sinan ALAGÖZ", "kisi_tel" : "5053165096"},'
        '{"kisi_id": "2", "kisi_ad" : "Suzan ALAGÖZ", "kisi_tel" : "5300802552"} ]} ';

    var jsonVeri2 = json.decode(strVeri2);
    var jsonArray = jsonVeri2["kisiler"] as List;

    var jsonVeri = json.decode(strVeri);
    var jsonNesne = jsonVeri["mesajlar"];
    Mesajlar mesaj = Mesajlar.fromJson(jsonNesne);

    print('mesaj_kod: ${mesaj.mesaj_kod}');
    print('mesaj_icerik: ${mesaj.mesaj_icerik}');

    Iterable<Kisiler> kisilerListesi = jsonArray.map((e) => Kisiler.fromJson(e));


    for(var tt in kisilerListesi)
      {
        print('Kişi id: ${tt.kisi_id}, Kişi ad: ${tt.kisi_ad}, Kişi tel: ${tt.kisi_tel},');
    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mesajParse();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),

    );
  }
}
