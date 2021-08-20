import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../widgets/drawer.dart';
import 'dart:convert';

class HomePageFb extends StatefulWidget {
  const HomePageFb({Key? key}) : super(key: key);

  @override
  _HomePageFbState createState() => _HomePageFbState();
}

class _HomePageFbState extends State<HomePageFb> {
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    var res = await http.get(Uri.parse(url));
    // print(res.body);
    data = jsonDecode(res.body);
    // print(data);
    // return data;
    return jsonDecode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome App"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text("Fetch Something"),
              );
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Fetch Something"),
                );
              } else {
                for (int i = 0; i < 10; i++) {
                  print(
                      "This is print snapshot ${snapshot.data[i]}"); // print data
                }
                print(
                    "This is type of snapshot ${snapshot.data.runtimeType}"); // print data
                // final Map temp = snapshot.data[0] as Map;
                // print(temp);
                // return ListView.builder(
                //   itemBuilder: (context, index) {
                //     return ListTile(
                //         // title: Text(jsonDecode(snapshot.data![index]["title"])),
                //         // subtitle: Text("ID: ${snapshot.data[index]["id"]}"),
                //         // leading: Image.network(snapshot.data[index]["url"]),
                //         );
                //   },
                //   // itemCount: snapshot.data!.length,
                // );
                return Center(
                  child: Text("Anything"),
                );
              }
          }
        },
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: Icon(Icons.refresh),
      ),
    );
  }
}
