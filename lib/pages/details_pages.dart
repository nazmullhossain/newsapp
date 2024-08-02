import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/publicController.dart';

class DetailsPages extends StatefulWidget {
  const DetailsPages({super.key, required this.id});
  final int id;

  @override
  State<DetailsPages> createState() => _DetailsPagesState();
}

class _DetailsPagesState extends State<DetailsPages> {
  Future<void> _initData() async {
    await Publiccontroller.pc.getDetailsNews(widget.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Publiccontroller>(builder: (pc) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Detisl"),
          centerTitle: true,
        ),
        body: pc.itemData == null
            ? Center(child: Text('Failed to load data'))
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pc.itemData['title'] ?? 'No Title',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'By: ${pc.itemData['by']}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Score: ${pc.itemData['score']}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    // Text(
                    //   'Time: ${DateTime.fromMillisecondsSinceEpoch(pc.itemData['time'] * 1000)}',
                    //   style: TextStyle(fontSize: 18),
                    // ),
                    SizedBox(height: 16),
                    Text(
                      pc.itemData['text'] ?? 'No Content',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
