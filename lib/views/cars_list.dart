import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class CarsList extends StatefulWidget {
  const CarsList({super.key});

  @override
  State<CarsList> createState() => _CarsListState();
}

class _CarsListState extends State<CarsList> {
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference CarsDoc = FirebaseFirestore.instance.collection('cars');
 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<QuerySnapshot<Object?>>(
          future: CarsDoc.get(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData == false && snapshot.data == null) {
              return Text("Document does not exist");
            }
            print(snapshot.connectionState.toString());
            if (snapshot.connectionState == ConnectionState.done) {
               return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    "Full Name: ${snapshot.data!.docs[index]['name']} ${snapshot.data!.docs[index]['color']} ${snapshot.data!.docs[index]['price']}}",
                    /* ${snapshot.data!.docs[index].data().toString().contains('desc') ? snapshot.data?.docs[index]['desc'] : '--'*/
                  );
                },
              );
            }
            return Text("loading");
          },
        )
      );
   }
  }