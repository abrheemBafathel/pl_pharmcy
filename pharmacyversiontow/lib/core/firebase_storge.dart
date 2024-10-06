import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorgeMothed{
 Future<String?> addImage(File file , String imageName)async{
   try{
      print("=================3======================");

   imageName = Random().nextInt(10000).toString() + imageName;
     print("=================4======================");

    var storgeRef= FirebaseStorage.instance.ref(imageName);
      print("=================5======================");

    await storgeRef.putFile(file);
      print("=================6======================");

    var imageUrl= await storgeRef.getDownloadURL();
    print("===================Url========================");
    print("Url  :  $imageUrl");
    return imageUrl;

   }catch(e){
      print("ERROR : $e");
      return null;
   }
 }

 Future<void> deleteImage(String imageurl) async{
   await FirebaseStorage.instance.refFromURL(imageurl).delete();

 }
}