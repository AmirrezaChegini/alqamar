import 'package:al_qamar/constants/api.dart';
import 'package:al_qamar/utils/error_handling/app_exceptions.dart';
import 'package:al_qamar/utils/error_handling/check_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

abstract class UserDatasource {
  Future<Response> createUser({
    required String firstName,
    required String lastName,
  });
  Future<Response> getUser();
  Future<Response> updateUser({
    required int id,
    required String firstName,
    required String lastName,
    XFile? avatar,
    required String bio,
  });
}

class UserRemote implements UserDatasource {
  final Dio _dio;
  UserRemote(this._dio);

  @override
  Future<Response> createUser(
      {required String firstName, required String lastName}) async {
    try {
      Response response = await _dio.post(
        Api.profile,
        options: Options(headers: {'requiredToken': true}),
        data: {
          'first_name': firstName,
          'last_name': lastName,
        },
      );

      return response;
    } on DioException catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }

  @override
  Future<Response> getUser() async {
    try {
      Response response = await _dio.get(
        Api.profile,
        options: Options(headers: {'requiredToken': true}),
      );

      return response;
    } on DioException catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }

  @override
  Future<Response> updateUser({
    required int id,
    required String firstName,
    required String lastName,
    XFile? avatar,
    required String bio,
  }) async {
    // FormData formData;

    // if (avatar != null) {
    //   formData = FormData.fromMap({
    //     'first_name': firstName,
    //     'last_name': lastName,
    //     'avatar': await MultipartFile.fromFile(
    //       File(avatar.path).path,
    //       filename: avatar.name,
    //     ),
    //     'bio': bio,
    //   });
    // } else {
    //   formData = FormData.fromMap({
    //     'first_name': firstName,
    //     'last_name': lastName,
    //     'bio': bio,
    //   });
    // }

    try {
      Response response = await _dio.put(
        '${Api.profile}/$id',
        options: Options(headers: {'requiredToken': true}),
        queryParameters: {
          'first_name': firstName,
          'last_name': lastName,
          'bio': bio,
        },
      );
      return response;
    } on DioException catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }
}
