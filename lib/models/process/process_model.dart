class CreateProcessSubmit {
  int id;
  int projectId;

  CreateProcessSubmit({this.id, this.projectId});

  CreateProcessSubmit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_id'] = this.projectId;
    return data;
  }
}
