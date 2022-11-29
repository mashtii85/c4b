class ProductListReqModel {
  ProductListReqModel({
    required this.pageNumber,
    required this.pageSize,
  });
  late final int pageNumber;
  late final int pageSize;

  ProductListReqModel.fromJson(Map<String, dynamic> json){
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pageNumber'] = pageNumber;
    _data['pageSize'] = pageSize;
    return _data;
  }
}