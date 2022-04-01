import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tugas_frontend_5/model/Travels.dart';
import 'package:tugas_frontend_5/services/TravelsServices.dart';
import 'DetailPage.dart';

class LandingPage extends StatefulWidget {
  static final url = "/";
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late Future<Travels> _travels;
  int id = 0;

  @override
  void initState() {
    super.initState();
    _travels = TravelsServices().getAllTravels();
  }

  void refreshData() {
    id++;
  }

  FutureOr onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/form-create').then(onGoBack);
        },
      ),
      body: FutureBuilder(
        future: _travels,
        builder: (context, AsyncSnapshot<Travels> snapshot) {
          var state = snapshot.connectionState;
          if (state != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  var Travel = snapshot.data!.data[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, DetailPage.url,
                          arguments: Travel);
                    },
                    child: listItem(Travel),
                  );
                },
                itemCount: snapshot.data!.data.length,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else {
              return Text('');
            }
          }
        },
      ),
    );
  }

  Widget listItem(Travel place) {
    return Card(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(flex: 1, child: Image.network(place.imageUrl)),
        Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    place.nama,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(place.kota),
                ],
              ),
            )),
      ]),
    );
  }
}
