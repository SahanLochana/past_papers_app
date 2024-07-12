import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:past_papers_app/Data/Models/pdf_file.dart';

class FirebaseServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  // Read data
  void getPdf() async {
    _db.collection("al_pdfs").doc("01").collection("pdfs").get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          toPdfFile(docSnapshot.data());
        }
      },
      // ignore: avoid_print
      onError: (e) => print("Error completing: $e"),
    );
  }

  PdfFile toPdfFile(Map docData) {
    String fName = docData["name"];
    String fId = docData["fId"];
    String fIconPath = docData["iconPath"];

    return PdfFile(fileName: fName, fileId: fId, iconPath: fIconPath);
  }
}
