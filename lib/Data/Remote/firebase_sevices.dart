import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:past_papers_app/Data/Models/recent_pdf_file.dart';

class FirebaseServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  // Read data
  Future<List<RecentPdfFile>> getPdf(String sId) async {
    List<RecentPdfFile> returnList = [];
    await _db.collection("al_pdfs").doc(sId).collection("pdfs").get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          RecentPdfFile pdfFile = toPdfFile(docSnapshot.data());
          returnList.add(pdfFile);
        }
        return returnList;
      },
      onError: (e) {
        return e;
      },
    );
    return returnList;
  }

  RecentPdfFile toPdfFile(Map docData) {
    String fName = docData["name"];
    String fId = docData["fId"];
    String fUrl = docData["url"];

    return RecentPdfFile(fileName: fName, fileId: fId, url: fUrl);
  }
}
