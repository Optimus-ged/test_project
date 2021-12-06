import 'package:ackaton_manage/models/mission/mission_response.dart';
import 'package:ackaton_manage/models/participant/participant_response.dart';
import 'package:ackaton_manage/models/task/task_response.dart';
import 'package:ackaton_manage/models/user/user_response.dart';

class GlobalData {
  static List<TaskResponse> tasks = [];
  static List<ParticipantResponse> participants = [];
  static List<MissionResponse> missions = [];
  static User currentUser = User();
}
