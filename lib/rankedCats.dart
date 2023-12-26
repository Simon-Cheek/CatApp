import 'package:flutter/material.dart';
import 'catcard.dart';
// ignore_for_file: prefer_const_constructors

class RankedCatsPage extends StatefulWidget {
  final List<CatCard> rankedCats;
  const RankedCatsPage({Key? key, required this.rankedCats}) : super(key: key);

  @override
  State<RankedCatsPage> createState() => _RankedCatsPageState();
}

Widget createCard(cat, index) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 8.0,
    ),
    decoration: BoxDecoration(
      border: Border.all(width: 1.0, color: Colors.grey.withOpacity(0.6)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(0, 3),
        )
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Image(
            image: AssetImage(cat.link),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "$index: ${cat.desc}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

class _RankedCatsPageState extends State<RankedCatsPage> {
  late List<CatCard> rankedCats;
  @override
  void initState() {
    super.initState();
    rankedCats = widget.rankedCats;
  }

  @override
  void didUpdateWidget(RankedCatsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    rankedCats = widget.rankedCats;
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Column(
                children: rankedCats
                    .map((cat) => createCard(cat, rankedCats.indexOf(cat) + 1))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// DESIGN REST OF PAGE TO SHOW CAT RANKINGS NEXT
// !!!!!!