import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/homepage/workers/controller/worker_controller.dart';
import 'package:pharmacyversiontow/homepage/workers/view/widegt/custom_worker_view.dart';

class ViewPharmacyWrkers extends StatelessWidget {
  const ViewPharmacyWrkers({super.key});

  @override
  Widget build(BuildContext context) {
    final WorkerController workerController=Get.put(WorkerController());
    return Scaffold(
      appBar: AppBar(title: Text("199".tr)),
      body:  GetBuilder<WorkerController>(
          builder: (controller) => FutureBuilder<QuerySnapshot>(
              future:controller.searching(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      QueryDocumentSnapshot qDS = snapshot.data!.docs[index];
                      return CustomWorkerView(workerName: qDS["username"], onPressed: () {
                        if( qDS["activite"]==1){
                          controller.updateActiviting(qDS.id, 0, "user have been  unactivite successfully");

                        }else{
                           controller.updateActiviting(qDS.id, 1, "user have been activite successfully");
                        }

                      },
                      btnTital: qDS["activite"]==1 ?"unactivite":"activite",
                       color:qDS["activite"]==1 ?Colors.blue:Colors.red ,);
                      
                    },
                    itemCount: snapshot.data!.docs.length,
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("157".tr),
                  );
                }
                return Center(
                  child: Text("134".tr),
                );
              })),
        )
    );
  }
}