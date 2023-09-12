import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:host_management/hostel_Management/view/pages/hostel_fee/hostel_fee_create/domain/utils.dart';

import '../../../../colors/colors.dart';
import '../domain/hostel_fee_model.dart';

class HostelFeeRepository {
  static const String className = "HostelFeeRepository"; //for log()
  final CollectionReference<Map<String, dynamic>> _fireStore = FirebaseFirestore
      .instance
      .collection("SchoolListCollection")
      .doc("0OdOkV1YzEab2BuGRtv4q9qcyfU2")
      .collection("2024-June-2025-March")
      .doc("2024-June-2025-March")
      .collection("Hostel");

  Future<void> createNewCategory({required Map<String, dynamic> data}) async {
    try {
      await _fireStore.doc("fees").get().then((value) async {
        if (!value.exists) {
          await _fireStore
              .doc("fees")
              .set({"time": Timestamp.now().millisecondsSinceEpoch});
        }
      }); //it for just add a value
      await _fireStore
          .doc("fees")
          .collection("feesCategory")
          .get()
          .then((value) async {
        bool isNameUnique = value.docs.every(
          (map) =>
              map['categoryName'].toString().toLowerCase().trim() !=
              data['categoryName'].toString().toLowerCase().trim(),
        ); //checking value is unique
        if (isNameUnique) {
          await _fireStore
              .doc("fees")
              .collection("feesCategory")
              .doc(data["id"])
              .set(data);
          showToast(msg: "Successfully Created");
        } else {
          showToast(
              msg: "Category already exist",
              linearGradientString: linearGradientRedClr);
        }
      });
    } catch (e) {
      log(e.toString(), name: "{$className : createNewCategory}");
      showToast(
          msg: "Something went wrong",
          linearGradientString: linearGradientRedClr);
    }
  }

  Future<void> createHostelFee({required HostelFeeModel data}) async {
    try {
      await _fireStore
          .doc("fees")
          .collection("fees")
          .doc(data.feesId)
          .set(data.toMap());
      showToast(msg: "Successfully created");
    } catch (e) {
      log(e.toString(), name: "{$className : createHostelFee}");
      showToast(
          msg: "Something went wrong",
          linearGradientString: linearGradientRedClr);
    }
  }

  Future<void> updateHostelFee({required HostelFeeModel data}) async {
    try {
      await _fireStore
          .doc("fees")
          .collection("fees")
          .doc(data.feesId)
          .set(data.toMap());
      showToast(msg: "Successfully Updated");
    } catch (e) {
      log(e.toString(), name: "{$className : createHostelFee}");
      showToast(
          msg: "Something went wrong",
          linearGradientString: linearGradientRedClr);
    }
  }

  Future<List<HostelFeeCategoryModel>> fetchAllFeesCategory() async {
    try {
      final data =
          await _fireStore.doc("fees").collection("feesCategory").get();
      final List<HostelFeeCategoryModel> feesCategories = data.docs
          .map((e) => HostelFeeCategoryModel.fromMap(e.data()))
          .toList();
      return feesCategories;
    } catch (e) {
      log(e.toString(), name: "{$className : fetchAllFeesCategory}");
      showToast(
          msg: "Something went wrong",
          linearGradientString: linearGradientRedClr);
      return [];
    }
  }

  Stream<List<HostelFeeModel>> fetchAllHostelFees() async* {
    yield* _fireStore
        .doc('fees')
        .collection('fees')
        .snapshots()
        .map((QuerySnapshot snapshot) {
      return snapshot.docs
          .map((e) => HostelFeeModel.fromMap(e.data() as Map<String, dynamic>))
          .toList();
    });
  }

  Future<String> getCategoryName({required String categoryId}) async {
    try {
      final data = await _fireStore
          .doc("fees")
          .collection("feesCategory")
          .doc(categoryId)
          .get();
      return data.data()?["categoryName"];
    } catch (e) {
      log(e.toString(), name: "{$className : getCategoryName}");
      showToast(
          msg: "Something went wrong",
          linearGradientString: linearGradientRedClr);
      return "";
    }
  }
}
