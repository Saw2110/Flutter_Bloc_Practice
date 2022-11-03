class UserModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  String? error;
  List<UserDataModel>? data;

  UserModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  UserModel.withError(String errorMessage) {
    error = errorMessage;
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <UserDataModel>[];
      json['data'].forEach((v) {
        data!.add(UserDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['per_page'] = perPage;
    data['total'] = total;
    data['total_pages'] = totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDataModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserDataModel({this.id, this.email, this.firstName, this.lastName, this.avatar});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }
}
