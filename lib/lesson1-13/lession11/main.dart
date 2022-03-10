import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INT3120 20',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lesson 11'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final list = [
    {
      'title': 'meo',
      'desc': 'huy',
      'coverUrl': 'assets/images/1.jpg',
    },
    {
      'title': 'cho',
      'desc': 'hieu',
      'coverUrl': 'assets/images/1.jpg',
    },
    {
      'title': 'ho',
      'desc': 'tuong',
      'coverUrl': 'assets/images/1.jpg',
    },
    {
      'title': 'de',
      'desc': 'cao',
      'coverUrl': 'assets/images/1.jpg',
    },
    {
      'title': 'te giac',
      'desc': 'hoang',
      'coverUrl': 'assets/images/1.jpg',
    },
    {
      'title': 'te giac',
      'desc': 'hoang',
      'coverUrl': 'assets/images/1.jpg',
    },
    {
      'title': 'te giac',
      'desc': 'hoang',
      'coverUrl': 'assets/images/1.jpg',
    },
    {
      'title': 'te giac',
      'desc': 'hoang',
      'coverUrl': 'assets/images/1.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final item = list[index];
            return ItemBox(
              item: Item(item['title']!, item['desc']!, item['coverUrl']!, 0),
            );
          },
        ),
      ),
    );
  }
}

class ItemBox extends StatelessWidget {
  const ItemBox({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: item,
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(image: AssetImage(item.coverUrl)),
              ),
            ),
            title: Text(item.title),
            subtitle: Text(item.desc),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 80),
              child: ScopedModelDescendant<Item>(builder: (context, child, model) {
                return RatingBox(item: model);
              })),
        ],
      ),
    );
  }
}

class RatingBox extends StatelessWidget {
  const RatingBox({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [1, 2, 3, 4, 5]
          .map(
            (i) => IconButton(
          onPressed: () {
            item.setRating(i);
          },
          icon: item.rating >= i
              ? const Icon(Icons.star)
              : const Icon(Icons.star_border),
          color: Colors.amber,
        ),
      )
          .toList(),
    );
  }
}

class Item extends Model {
  final String title;
  final String desc;
  final String coverUrl;
  int rating;

  Item(this.title, this.desc, this.coverUrl, this.rating);

  factory Item.fromMap(Map<String, dynamic> json) {
    return Item(json['title'], json['desc'], json['coverUrl'], 0);
  }

  void setRating(newRating) {
    rating = newRating;
    notifyListeners();
  }
}