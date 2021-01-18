import 'package:cloud_firestore/cloud_firestore.dart';

class PostCrudMethods {
  // ignore: non_constant_identifier_names
  Future<void> AddData(postData) async {
    // ignore: deprecated_member_use
    Firestore.instance.collection("Posts").add(postData).catchError((e) {
      print(e);
    });
  }

  getData() async {
    // ignore: deprecated_member_use
    return await Firestore.instance.collection("Posts").getDocuments();
  }

  getCategory() async {
    // ignore: deprecated_member_use
    return await Firestore.instance.collection("Category").getDocuments();
  }

  getRetailerData() async {
    // ignore: deprecated_member_use
    return await Firestore.instance
        .collection("Posts")
        .where("category", isEqualTo: "retailer")
        .getDocuments();
  }

  getWholsaleData() async {
    // ignore: deprecated_member_use
    return await Firestore.instance
        .collection("Posts")
        .where("category", isEqualTo: "wholsaler")
        .getDocuments();
  }

  getDistibuterData() async {
    // ignore: deprecated_member_use
    return await Firestore.instance
        .collection("Posts")
        .where("category", isEqualTo: "distributer")
        .getDocuments();
  }

  getGeneralData() async {
    // ignore: deprecated_member_use
    return await Firestore.instance
        .collection("Posts")
        .where("category", isEqualTo: "general services")
        .getDocuments();
  }
}
