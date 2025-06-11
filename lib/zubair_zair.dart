import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';


class ZubairZairWallpaper extends StatefulWidget {
  final dynamic SelectedImagelink;

  const ZubairZairWallpaper({super.key,required this.SelectedImagelink});
  @override
  State<ZubairZairWallpaper> createState() => _ZubairZairWallpaperState();
}

class _ZubairZairWallpaperState extends State<ZubairZairWallpaper> {
  Future<void> setwallpaer()async{
    int location=WallpaperManager.HOME_SCREEN;
    var file= await DefaultCacheManager().getSingleFile(widget.SelectedImagelink);
     final Future<bool> result=WallpaperManager.setWallpaperFromFile(file.path, location);
  }
  Future<void> setlockscreen()async{
    int location=WallpaperManager.LOCK_SCREEN;
    var file= await DefaultCacheManager().getSingleFile(widget.SelectedImagelink);
    final Future<bool> result=WallpaperManager.setWallpaperFromFile(file.path, location);
  }
  Future<void> setonbothscreen()async{
    int location=WallpaperManager.BOTH_SCREEN;
    var file= await DefaultCacheManager().getSingleFile(widget.SelectedImagelink);
    final Future<bool> result=WallpaperManager.setWallpaperFromFile(file.path, location);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            elevation: 4,
            title: Center(
              child: Column(
                children: [
                  Text(
                    'Muhammad Zubair Zair',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '2022-ag-8571',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.tealAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: Container(
                child: InteractiveViewer(child: Image(image: NetworkImage(
                  widget.SelectedImagelink
                ))),
                  ),
            ),
            GestureDetector(
              onTap: () {
                setwallpaer();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Set AS Home Screen",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setlockscreen();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Set AS Lock Screen",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setonbothscreen();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Set On Both Screen",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
