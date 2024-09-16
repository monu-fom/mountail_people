// To parse this JSON data, do
//
//     final parentModel = parentModelFromJson(jsonString);

class ParentModel<T>{
  final String? status;
  final String? message;
  final T data;

  ParentModel({
    this.status,
    this.message,
    required this.data
  });

  factory ParentModel.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonModel){
    if(json['status'].toString().toLowerCase() == 'success'){
      return ParentModel(status: json['status'], message: json['message'], data: json['data']);
    }
    else{
      return ParentModel(status: json['status'], message: json['message'], data: json['error']);
    }
  }

}