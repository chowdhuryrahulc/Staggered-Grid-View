// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'image_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Grid(),
    );
  }
}

// class StandardGrid extends StatelessWidget {
//   const StandardGrid({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: imageList.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         mainAxisSpacing: 8,
//         crossAxisSpacing: 8,
//       ),
//       itemBuilder: (context, index) => ImageCard(
//         imageData: imageList[index],
//       ),
//     );
//   }
// }

// class StandardStaggeredGrid extends StatelessWidget {
//   const StandardStaggeredGrid({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StaggeredGridView.countBuilder(
//       crossAxisCount: 3,
//       itemCount: imageList.length,
//       itemBuilder: (context, index) => ImageCard(
//         imageData: imageList[index],
//       ),
//       staggeredTileBuilder: (index) => StaggeredTile.count(1, 1),
//       mainAxisSpacing: 8.0,
//       crossAxisSpacing: 8.0,
//     );
//   }
// }

// class InstagramSearchGrid extends StatelessWidget {
//   const InstagramSearchGrid({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StaggeredGridView.countBuilder(
//       crossAxisCount: 3,
//       itemCount: imageList.length,
//       itemBuilder: (context, index) => ImageCard(
//         imageData: imageList[index],
//       ),
//       staggeredTileBuilder: (index) => StaggeredTile.count(
//           (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
//       mainAxisSpacing: 8.0,
//       crossAxisSpacing: 8.0,
//     );
//   }
// }

class PinterestGrid extends StatelessWidget {
  const PinterestGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: imageList.length,
      itemBuilder: (context, index) => ImageCard(
        imageData: imageList[index],
      ),
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}

class ImageCard extends StatelessWidget {
  ImageCard({required this.imageData});

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.network(imageData.imageUrl, fit: BoxFit.cover),
    );
  }
}

//TODO            MY CODE
class Grid extends StatelessWidget {
  const Grid({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: cardGridList.length,
      itemBuilder: (context, index) => CardGrid(list: cardGridList[index]),
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      shrinkWrap: true,
    );
  }
}

class CardGrid extends StatelessWidget {
  CardGrid({Key? key, required this.list}) : super(key: key);
  List list;
  // List<cardGridList>? titleList;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              list.word,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(list.defination, style: TextStyle(fontSize: 15)),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.favorite_border),
                PopupMenuButton(itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Icon(Icons.edit), Text(' Edit')],
                    )),
                    PopupMenuItem(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Icon(Icons.show_chart), Text(' Progress')],
                    )),
                    PopupMenuItem(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.add_circle_outline),
                        Text(' Add to ignored')
                      ],
                    )),
                    PopupMenuItem(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.delete, color: Colors.red),
                        Text(' Remove')
                      ],
                    ))
                  ];
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class List {
  String word;
  String defination;
  List({required this.word, required this.defination});
}

var cardGridList = [
  List(word: 'vorrang', defination: 'priority'),
  List(word: 'rachen', defination: 'throat/jaw'),
  List(word: 'untergekommen', defination: 'find a job/accomodaton'),
  List(word: 'borgen', defination: 'borrow'),
  List(word: 'inhaltlich', defination: 'content'),
];
