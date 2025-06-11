import 'dart:convert';

import 'package:http/http.dart ' as http;
import 'package:flutter/material.dart';
import 'zubair_zair.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page=1;
  List Images_Link=[];
    void ConnectionAPI()async{
      await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
      headers: {'Authorization':'5mLhWYjQyupXoxBVRWkZAVvFojXw4XDs9fxMWmZfgv8XvQUsIIQdEITB'}
      ).then((Value_zair){
     //   print(Value_zair);
       // print(Value_zair.body);
        Map Result=jsonDecode(Value_zair.body);
        setState(() {
          Images_Link.addAll(Result["photos"]);
          print(Images_Link.length);
        });
      });
    }
  void Moreloading()async{
      setState(() {
        page++;
      });
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?page=$page&per_page=80'),
        headers: {'Authorization':'5mLhWYjQyupXoxBVRWkZAVvFojXw4XDs9fxMWmZfgv8XvQUsIIQdEITB'}
    ).then((Value_zair){
      //   print(Value_zair);
      // print(Value_zair.body);
      Map Result=jsonDecode(Value_zair.body);
      setState(() {
        Images_Link.addAll(Result["photos"]);
        print(Images_Link.length);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      ConnectionAPI();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                //itemCount: 10,
                itemCount: Images_Link.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                // delegate tells row and colums
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap:(){
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> ZubairZairWallpaper(
                              SelectedImagelink: Images_Link[index]['src']['large2x'],
                            )));
                      });
                    },
                    child: Container(
                      color: Colors.green,
                       child: Image(loadingBuilder:(context,child,loadingImage) {
                        if(loadingImage==null)
                        {
                        return child;
                        }
                        else
                        {
                        return CircularProgressIndicator(color: Colors.white);
                        }

                         },

                           fit:BoxFit.cover,
                           image: NetworkImage(
                        Images_Link[index]['src']['tiny']
                     )),
                    ),
                  );
              //    builder gridview must have return type
                //  simple grid vie not have return vtype
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                Moreloading();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.deepPurple,
                child: Center(
                  child: Text(
                    "Click here for more...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
