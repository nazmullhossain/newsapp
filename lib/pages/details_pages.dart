import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/controller/api_serverice.dart';

import '../controller/publicController.dart';

class DetailsPages extends StatefulWidget {
  const DetailsPages({super.key, required this.id});
  final int id;

  @override
  State<DetailsPages> createState() => _DetailsPagesState();
}

class _DetailsPagesState extends State<DetailsPages> {
  ApiServerice apiServerice = ApiServerice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("News Details",style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff063970),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Map<String, dynamic>>(
          future: apiServerice.fetchItem(widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final item = snapshot.data;
              int timeStamp = item!['time'];
              DateTime dateTime =
                  DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
              final kids = item!['kids'] ?? "";

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        textAlign: TextAlign.center,
                        'Title: ${item['title']}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Container(
                      child: Column(
                        children: [
                          Text('Author: ${item['by']}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text(
                              'Comment Length: ${ kids.length }',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('Score: ${item['score']}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('type: ${item['type']}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(
                              'Date Time: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime)}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text('List of comment: ${item['kids']}',
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
