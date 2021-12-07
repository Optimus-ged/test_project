class CreateProcessSubmit {
  String projectId;

  CreateProcessSubmit({this.projectId});

  CreateProcessSubmit.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectId'] = this.projectId;
    return data;
  }
}
