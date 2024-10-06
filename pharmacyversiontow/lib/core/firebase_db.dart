import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Databasemethods {
  Future addData(
      Map<String, dynamic> infoMap, String id, String collectionName) async {
    return await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(id)
        .set(infoMap);
  }

  Future addBackUpData(
      Map<String, dynamic> infoMap,
      String firstId,
      String firstcollectionName,
      String scandcollectionName,
      String scandId) async {
    return await FirebaseFirestore.instance
        .collection(firstcollectionName)
        .doc(firstId)
        .collection(scandcollectionName)
        .doc(scandId)
        .set(infoMap);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getBackUpData(
      String firstcollectionName, String scandcollectionName, String id) async {
    return await FirebaseFirestore.instance
        .collection(firstcollectionName)
        .doc(id)
        .collection(scandcollectionName)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getMedicinData(
      String collectionName) async {
    return await FirebaseFirestore.instance.collection(collectionName).get();
  }

  Future sreachData(String collectionName, String filedKey, var value) async {
    return await FirebaseFirestore.instance
        .collection(collectionName)
        .where(filedKey, isEqualTo: value)
        .get();
  }

  /////////////////////
  /////////////////
  ///////////////////////
  // Future<QuerySnapshot<Map<String,dynamic>>>?
  Future sreachWorker(String collectionName, String filedKey, String value,
      String keyTow, String valueTow) async {
    //try {
    return await FirebaseFirestore.instance
        .collection(collectionName)
       //.where(keyTow, isNotEqualTo: valueTow)
       .where(filedKey, isEqualTo: value)
        .get();
    /* } catch (e) {
      Get.defaultDialog(
        title: "error",
        middleText: "$e",
        onCancel: () {},
      );
    }*/
  }

  Future<void> deleteRecord(String collectionName, String recordId) async {
    return await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(recordId)
        .delete();
  }

////////////////////////update
  Future<void> updateRecord(
      String collectionName, String recordId, Map<Object, Object?> data) async {
    return await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(recordId)
        .update(data);
  }
}
