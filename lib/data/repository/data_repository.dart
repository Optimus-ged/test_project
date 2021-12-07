import 'package:ackaton_manage/data/dio/interceptors.dart';
import 'package:ackaton_manage/models/mission/mission_response.dart';
import 'package:ackaton_manage/models/process/process_model.dart';
import 'package:ackaton_manage/models/process/process_response.dart';
import 'package:dio/dio.dart';

const upload = 'http://192.168.137.1:3050/images/';

class DataRepository {
  Dio _dio;

  // Initialisation of dio options
  DataRepository() {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: "http://192.168.137.1/project/hackaton/public/api",
        receiveDataWhenStatusError: true,
        connectTimeout: 1000 * 30, // 30 seconds
        receiveTimeout: 1000 * 30, // 30 seconds
      );
      _dio = Dio(options);
      _dio.interceptors.add(AppInterceptors());
    }
  }

  // Login contribuable
  // Future<LoginResponse> loginUser(LoginSubmit loginSubmit) async {
  //   final result = await _dio.post(
  //     "/contribuable/signin",
  //     data: loginSubmit.toJson(),
  //   );
  //   return LoginResponse.fromJson(result.data);
  // }

  // Signup contribuable
  // Future<SignupResponse> signupContribuable(SignupSubmit signupSubmit) async {
  //   final result = await _dio.post(
  //     "/contribuable/signup",
  //     data: signupSubmit.toJson(),
  //   );
  //   return SignupResponse.fromJson(result.data);
  // }

  Future<MissionResponse> getAllMissions() async {
    final result = await _dio.get(
      "/get_project_list",
    );
    return MissionResponse.fromJson(result.data);
  }

  Future<CreateProcessResponse> createProcess(
    CreateProcessSubmit submit,
  ) async {
    final result = await _dio.get(
      "/get_project_list",
    );
    return CreateProcessResponse.fromJson(result.data);
  }
}

final dataRepository = DataRepository();
