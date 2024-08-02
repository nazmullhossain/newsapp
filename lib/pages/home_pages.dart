import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/publicController.dart';
import 'details_pages.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  Future<void> _initData()async{
    if(Publiccontroller.pc.topStories==null
        ||Publiccontroller.pc.topStories.isEmpty){
      await Publiccontroller.pc.getAllNews();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Publiccontroller>(
      builder: (publicController) {
        if(publicController.size.value<=0.0) publicController.initApp(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("News Stories"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: SizedBox(
            height: MediaQuery.of(context).size.height *0.9,
              child:  ListView.builder(
                itemCount: publicController.topStories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsPages(id: publicController.topStories[index],)));
                    },

                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey
                      ),
                      child: ListTile(
                        title: Text('Story ID: ${publicController.topStories[index]}'),
                      ),
                    ),
                  );
                },
              ),
            ),
            ),
          );

      }
    );
  }
}
