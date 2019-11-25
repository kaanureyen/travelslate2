import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            FlatButton(
              onPressed: (){
              },
              color: Colors.black,
              child: Text(
                'Otomatik Seslendirme',
                textAlign: TextAlign.left,
                style:TextStyle(
                    color: Colors.white
                ),
              ),
            ),
            FlatButton(
              onPressed: (){

              },
              color: Colors.black87,
              child: const Center(
                child: Text(
                  'Otomatik Büyük Harf',
                  style:TextStyle(
                      color: Colors.white
                  ),
                ),

              ),
            ),

            SizedBox(
              height: 100,
            ),


            FlatButton(
              onPressed: (){

              },
              color: Colors.black54,
              child: Text('Abonelik Paketleri',
              style: TextStyle(
                color: Colors.white
              ),
              ),
            ),
            FlatButton(
              onPressed: (){

              },
              color: Colors.black45,
              child: const Center(
                child: Text(
                  'Abonelik Bilgileri',
                  style: TextStyle(
                    color: Colors.white
              ),
              ),
              ),
            ),
            FlatButton(
              onPressed: (){

              },
              color: Colors.black38,
              child: const Center(
                child: Text(
                    'Kullanıcı Sözleşmesi',
                  style:TextStyle(
                    color: Colors.white
                  ),
              ),

              ),
            ),
            FlatButton(
              onPressed: (){

              },
              color: Colors.black26,
              child: const Center(
                child: Text(
                  'Gizlilik Sözleşmesi',
                  style:TextStyle(
                      color: Colors.white
                  ),
                ),

              ),
            ),
            FlatButton(
              onPressed: (){

              },
              color: Colors.black12,
              child: const Center(
                child: Text(
                  'Bize Ulaşın',
                  style:TextStyle(
                      color: Colors.white
                  ),
                ),

              ),
            ),

          ],

        ),
      ),
    );
  }
}
