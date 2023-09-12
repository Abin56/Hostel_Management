// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HostelFeeModel {
  String? feesId;
  String? feesTitle;
  String? feesDescription;
  String? categoryId;
  num? paymentAmount;
  int? dueDate;
  int? createdAt;
  HostelFeeModel({
    this.feesId,
    this.feesTitle,
    this.feesDescription,
    this.categoryId,
    this.paymentAmount,
    this.dueDate,
    this.createdAt,
  });

  HostelFeeModel copyWith({
    String? feesId,
    String? feesTitle,
    String? feesDescription,
    String? categoryId,
    num? paymentAmount,
    int? dueDate,
    int? createdAt,
  }) {
    return HostelFeeModel(
      feesId: feesId ?? this.feesId,
      feesTitle: feesTitle ?? this.feesTitle,
      feesDescription: feesDescription ?? this.feesDescription,
      categoryId: categoryId ?? this.categoryId,
      paymentAmount: paymentAmount ?? this.paymentAmount,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'feesId': feesId,
      'feesTitle': feesTitle,
      'feesDescription': feesDescription,
      'categoryId': categoryId,
      'paymentAmount': paymentAmount,
      'dueDate': dueDate,
      'createdAt': createdAt,
    };
  }

  factory HostelFeeModel.fromMap(Map<String, dynamic> map) {
    return HostelFeeModel(
      feesId: map['feesId'] != null ? map['feesId'] as String : null,
      feesTitle: map['feesTitle'] != null ? map['feesTitle'] as String : null,
      feesDescription: map['feesDescription'] != null
          ? map['feesDescription'] as String
          : null,
      categoryId:
          map['categoryId'] != null ? map['categoryId'] as String : null,
      paymentAmount:
          map['paymentAmount'] != null ? map['paymentAmount'] as num : null,
      dueDate: map['dueDate'] != null ? map['dueDate'] as int : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HostelFeeModel.fromJson(String source) =>
      HostelFeeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HostelFeeModel(feesId: $feesId, feesTitle: $feesTitle, feesDescription: $feesDescription, categoryId: $categoryId, paymentAmount: $paymentAmount, dueDate: $dueDate, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant HostelFeeModel other) {
    if (identical(this, other)) return true;

    return other.feesId == feesId &&
        other.feesTitle == feesTitle &&
        other.feesDescription == feesDescription &&
        other.categoryId == categoryId &&
        other.paymentAmount == paymentAmount &&
        other.dueDate == dueDate &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return feesId.hashCode ^
        feesTitle.hashCode ^
        feesDescription.hashCode ^
        categoryId.hashCode ^
        paymentAmount.hashCode ^
        dueDate.hashCode ^
        createdAt.hashCode;
  }
}

class HostelFeeCategoryModel {
  String? id;
  String? categoryName;
  HostelFeeCategoryModel({
    this.id,
    this.categoryName,
  });

  HostelFeeCategoryModel copyWith({
    String? id,
    String? categoryName,
  }) {
    return HostelFeeCategoryModel(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categoryName': categoryName,
    };
  }

  factory HostelFeeCategoryModel.fromMap(Map<String, dynamic> map) {
    return HostelFeeCategoryModel(
      id: map['id'] != null ? map['id'] as String : null,
      categoryName:
          map['categoryName'] != null ? map['categoryName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HostelFeeCategoryModel.fromJson(String source) =>
      HostelFeeCategoryModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'HostelFeeCategoryModel(id: $id, categoryName: $categoryName)';

  @override
  bool operator ==(covariant HostelFeeCategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.categoryName == categoryName;
  }

  @override
  int get hashCode => id.hashCode ^ categoryName.hashCode;
}
