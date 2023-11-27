import 'package:flutter/material.dart';
import 'package:app/catcard.dart';
// ignore_for_file: prefer_const_constructors

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(), title: 'Cat Ranking App');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CatCard> cats = [
    CatCard(link: "Assets/cats1.jpeg", desc: "Amazing Cat!"),
    CatCard(link: "Assets/cats2.jpeg", desc: "What a fine catto"),
    CatCard(link: "Assets/cats3.jpeg", desc: "Purrfect!"),
    CatCard(link: "Assets/cats4.jpeg", desc: "Meow Meow!"),
    CatCard(link: "Assets/cats5.jpeg", desc: "So soft"),
    CatCard(link: "Assets/cats6.jpeg", desc: "FUZZY"),
    CatCard(link: "Assets/cats7.jpeg", desc: "Soft kitty warm kitty"),
    CatCard(link: "Assets/cats8.jpeg", desc: "So cute"),
  ];

  Widget createCard(cat) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: 150.0,
      height: 200.0,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black,
          ),
        ),
        color: Colors.blue[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 100.0,
                width: 100.0,
                child: Image(
                  image: AssetImage(cat.link),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                cat.desc,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Rank Your Favorite Cats!',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Wrap(
                children: cats.map((cat) => createCard(cat)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
