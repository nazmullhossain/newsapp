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
          // backgroundColor: Colors.white70,
          appBar: AppBar(
            backgroundColor: Color(0xff063970),
            title: Text("News Stories",style: TextStyle(color: Colors.white),),
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
                      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff1280b1)
                      ),
                      child: ListTile(
                        title: Text('ID: ${publicController.topStories[index]}',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),),
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
