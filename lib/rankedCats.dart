import 'package:flutter/material.dart';
import 'catcard.dart';
// ignore_for_file: prefer_const_constructors

class RankedCatsPage extends StatefulWidget {
  final List<CatCard> rankedCats;
  const RankedCatsPage({super.key, required this.rankedCats});

  @override
  State<RankedCatsPage> createState() => _RankedCatsPageState();
}

class _RankedCatsPageState extends State<RankedCatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: 250.0,
        child: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: ListTile(
                    leading: Icon(Icons.home),
                    iconColor: Colors.blue,
                    title: Text("Cats"),
                    tileColor: Colors.cyan[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/RankedCatsPage');
                  },
                  child: ListTile(
                    leading: Icon(Icons.star),
                    iconColor: Colors.blue,
                    title: Text("Rankings"),
                    tileColor: Colors.cyan[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Ranked Cats:',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
