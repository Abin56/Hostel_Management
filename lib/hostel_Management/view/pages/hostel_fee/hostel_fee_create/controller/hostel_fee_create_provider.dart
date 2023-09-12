import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../domain/hostel_fee_model.dart';
import '../repository/hostel_fee_repository.dart';

class HostelFeeCreateProvider extends ChangeNotifier {
  final Uuid uuid = const Uuid();
  final HostelFeeRepository _repo = HostelFeeRepository();
  HostelFeeCategoryModel? selectedCategory;

  String feesTitle = "";
  String description = "";
  num amount = 0;
  int dueDate = -1;
  bool isLoading = false;
  bool isLoadingC = false;
  String newCategoryName = ""; //for creating new category

  Future<List<HostelFeeCategoryModel>> fetchAllHostelFeesCategory() async {
    final data = await _repo.fetchAllFeesCategory();
    return data;
  }

  Stream<List<HostelFeeModel>> fetchAllHostelFees() async* {
    final data = _repo.fetchAllHostelFees();
    yield* data;
  }

  Future<void> createNewFeeCategory({required String categoryName}) async {
    isLoadingCValue(value: true);
    String categoryId = uuid.v1();
    final data = {"id": categoryId, "categoryName": categoryName};
    await _repo.createNewCategory(data: data);
    clearAllFeilds();
    isLoadingCValue(value: false);
  }

  Future<void> createNewHostelFee() async {
    isLoadingValue(value: true);
    String feeId = uuid.v1();
    final HostelFeeModel data = HostelFeeModel(
        categoryId: selectedCategory?.id ?? "",
        dueDate: dueDate,
        feesDescription: description,
        feesId: feeId,
        feesTitle: feesTitle,
        paymentAmount: amount,
        createdAt: Timestamp.now().millisecondsSinceEpoch);

    await _repo.createHostelFee(data: data);
    clearAllFeilds();
    isLoadingValue(value: false);
  }

  Future<void> updateHostelFee({required HostelFeeModel data}) async {
    isLoadingValue(value: true);
    await _repo.updateHostelFee(data: data);
    clearAllFeilds();
    isLoadingValue(value: false);
  }

  Future<String> getCategoryName({required String categoryId}) async {
    if (categoryId.isEmpty) {
      return "";
    }
    final data = await _repo.getCategoryName(categoryId: categoryId);
    return data;
  }

  void clearAllFeilds() {
    selectedCategory = null;
    feesTitle = "";
    description = "";
    amount = 0;
    dueDate = -1;
    newCategoryName = "";
    isLoading = false;
    isLoadingC = false;
  }

  void isLoadingValue({required bool value}) {
    isLoading = value;
    notifyListeners();
  }

  void isLoadingCValue({required bool value}) {
    isLoadingC = value;
    notifyListeners();
  }
}
