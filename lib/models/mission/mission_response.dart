class MissionResponse {
  List<Data> data;

  MissionResponse({this.data});

  MissionResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String projectName;
  String description;
  String budget;
  String startDate;
  String endDate;
  int nbrJours;
  List<Members> members;

  Data(
      {this.id,
      this.projectName,
      this.description,
      this.budget,
      this.startDate,
      this.endDate,
      this.nbrJours,
      this.members});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectName = json['project_name'];
    description = json['description'];
    budget = json['budget'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    nbrJours = json['nbrJours'];
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members.add(new Members.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_name'] = this.projectName;
    data['description'] = this.description;
    data['budget'] = this.budget;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['nbrJours'] = this.nbrJours;
    if (this.members != null) {
      data['members'] = this.members.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Members {
  int memberId;
  String memberName;
  String email;
  String telephone;
  List<MemberTask> memberTask;

  Members(
      {this.memberId,
      this.memberName,
      this.email,
      this.telephone,
      this.memberTask});

  Members.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    memberName = json['member_name'];
    email = json['email'];
    telephone = json['telephone'];
    if (json['memberTask'] != null) {
      memberTask = <MemberTask>[];
      json['memberTask'].forEach((v) {
        memberTask.add(new MemberTask.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member_id'] = this.memberId;
    data['member_name'] = this.memberName;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    if (this.memberTask != null) {
      data['memberTask'] = this.memberTask.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberTask {
  int taskId;
  String projectTaskName;
  int status;

  MemberTask({this.taskId, this.projectTaskName, this.status});

  MemberTask.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    projectTaskName = json['project_task_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_id'] = this.taskId;
    data['project_task_name'] = this.projectTaskName;
    data['status'] = this.status;
    return data;
  }
}
