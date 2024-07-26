import 'dart:convert';
import 'dart:io';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/repository/auth_repository.dart';
import 'package:job_app/src/services/api.dart';

class ApiServices {
  final deviceStorage = GetStorage();
  Dio dio = Dio(BaseOptions(
      baseUrl: JAPI.url,
      connectTimeout: const Duration(seconds: 6000),
      receiveTimeout: const Duration(seconds: 6000),
      responseType: ResponseType.json,
      contentType: "application/json; charset=UTF-8"));
  Dio dioInterceptor = Dio(BaseOptions(
      baseUrl: JAPI.url,
      connectTimeout: const Duration(seconds: 6000),
      receiveTimeout: const Duration(seconds: 6000),
      responseType: ResponseType.json,
      contentType: "application/json; charset=UTF-8"));

  ApiServices() {
    dioInterceptor.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers["Accept"] = "application/json";
        String? token = deviceStorage.read("accessToken");
        options.headers["Authorization"] = 'Bearer $token';
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          final accessToken = await refreshToken();
          if (accessToken != null) {
            dioInterceptor.options.headers["Authorization"] =
                'Bearer $accessToken';
            return handler
                .resolve(await dioInterceptor.fetch(error.requestOptions));
          }
        }
        return handler.next(error);
      },
    ));
  }

  Future<Response> register(
      String fullname, String email, String role, String password) async {
    Map<dynamic, dynamic> param = {
      "fullname": fullname,
      "email": email,
      "role": role,
      "password": password,
    };
    try {
      final response =
          await dio.post(JAPI.urlRegister, data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error(
            "Quá trình đăng kí đã xảy ra sự cố! Vui lòng thử lại sau!");
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> login(String email, String password) async {
    Map<dynamic, dynamic> param = {
      "email": email,
      "password": password,
    };
    try {
      final response = await dio.post(JAPI.urlLogin, data: jsonEncode(param));
      deviceStorage.write("accessToken", response.data['access_token']);
      deviceStorage.write("refreshToken", response.data['refresh_token']);
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 401) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error(
            "Quá trình đăng nhập đã xảy ra sự cố! Vui lòng thử lại sau!");
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<String?> refreshToken() async {
    final refreshToken = deviceStorage.read("refreshToken");
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $refreshToken",
      "Accept": "application/json",
    };
    try {
      final response = await dio.post(JAPI.urlRefreshToken,
          options: Options(headers: headers));
      final newAccessToken = response.data['access_token'];
      deviceStorage.write("accessToken", response.data['access_token']);
      deviceStorage.write("refreshToken", response.data['refresh_token']);
      return newAccessToken;
    } catch (exception) {
      JLoader.warningSnackBar(
          title: "Giấy phép hết hạn", message: "Vui lòng đăng nhập lại.");
      GetStorage().write("isSignin", false);
      final authRepo = Get.put(AuthRepository());
      authRepo.screenRedirect();
    }
    return null;
  }

  // Province
  Future<Response> getProvince() async {
    try {
      final response = await dio.get(JAPI.urlProvince);
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> getDistrict(String provinceId) async {
    Map<dynamic, dynamic> param = {"provinceID": provinceId};
    try {
      final response = await dio.put(JAPI.urlDistrict, data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> getSkill() async {
    try {
      final response = await dio.get(JAPI.urlSkills);
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> getCategory() async {
    try {
      final response = await dio.get(JAPI.urlCategory);
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> updateAccountInfo(String fullname, String birthday,
      String phone, String gender, String provinceID, String districtID) async {
    Map<dynamic, dynamic> param = {
      "fullname": fullname,
      "birthday": birthday,
      "phone": phone,
      "gender": gender,
      "provinceID": provinceID,
      "districtID": districtID,
    };
    try {
      final response = await dioInterceptor.post(JAPI.urlUpdateInfo,
          data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> updatePersonalProfile(
    String categoryID,
    List<String> skillsID,
    String language,
    String informatic,
    String career,
    String job,
    String experience,
    String salary,
    String requirement,
    String strength,
  ) async {
    Map<dynamic, dynamic> param = {
      "categoryID": categoryID,
      "skillsID": skillsID,
      "language": language,
      "informatic": informatic,
      "career": career,
      "job": job,
      "experience": experience,
      "salary": salary,
      'requirement': requirement,
      'strength': strength
    };
    try {
      final response = await dioInterceptor.post(JAPI.urlUpdateProfile,
          data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> getProfile() async {
    try {
      final response = await dioInterceptor.get(JAPI.urlGetProfile);
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> getProfileWithID(String profileID) async {
    Map<dynamic, dynamic> param = {'profileID': profileID};
    try {
      final response = await dioInterceptor.post(JAPI.urlGetProfileWithID,
          data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> getListProfile() async {
    try {
      final response = await dioInterceptor.get(JAPI.urlGetListProfile);
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> getEnterpriseProfile() async {
    try {
      final response = await dioInterceptor.post(JAPI.urlGetEnterpriseProfile);
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> updateEnterpriseProfile(
      String enterpriseName, String taxCode, String activity) async {
    Map<dynamic, dynamic> param = {
      "enterpriseName": enterpriseName,
      "taxCode": taxCode,
      "activity": activity
    };
    try {
      final response = await dioInterceptor
          .post(JAPI.urlUpdateEnterpriseProfile, data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        print(err);
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> createJobEnterprise(
    String job,
    String categoryID,
    List<String> skillsID,
    List<String> skillsName,
    String startSalary,
    String upSalary,
    String workPlace,
    String jobDescription,
    String benefit,
    String requirement,
  ) async {
    Map<dynamic, dynamic> param = {
      "job": job,
      "categoryID": categoryID,
      "skillsID": skillsID,
      "skillsName": skillsName,
      "startSalary": startSalary,
      "upSalary": upSalary,
      "workPlace": workPlace,
      "jobDescription": jobDescription,
      "benefit": benefit,
      "requirement": requirement
    };
    try {
      final response =
          await dioInterceptor.post(JAPI.urlCreateJob, data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        print(err.response?.data["message"]);
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception);
    }
  }

  Future<Response> getEnterpriseJob() async {
    try {
      final response = await dioInterceptor.post(JAPI.urlGetEnterpriseJob);
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> getJob() async {
    try {
      final response = await dioInterceptor.post(JAPI.urlGetJob);
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> applyJob(
      String jobID, String profileID, String enterpriseID) async {
    Map<dynamic, dynamic> param = {
      "jobID": jobID,
      "enterpriseID": enterpriseID,
      "profileID": profileID,
    };
    try {
      final response =
          await dioInterceptor.post(JAPI.urlApply, data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> acceptApply(String applyID) async {
    Map<dynamic, dynamic> param = {
      "applyID": applyID,
    };
    try {
      final response = await dioInterceptor.post(JAPI.urlAcceptApply,
          data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> denyApply(String applyID) async {
    Map<dynamic, dynamic> param = {
      "applyID": applyID,
    };
    try {
      final response =
          await dioInterceptor.post(JAPI.urlDenyApply, data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> enterpriseListApplyJob(String enterpriseID) async {
    Map<dynamic, dynamic> param = {
      "enterpriseID": enterpriseID,
    };
    try {
      final response = await dioInterceptor.post(JAPI.urlEnterpriseListApply,
          data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> enterpriseListInterview(String enterpriseID) async {
    Map<dynamic, dynamic> param = {
      "enterpriseID": enterpriseID,
    };
    try {
      final response = await dioInterceptor.post(JAPI.urlListInteview,
          data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> getInterviewDetails(String jobSuccessID) async {
    Map<dynamic, dynamic> param = {
      "jobSuccessID": jobSuccessID,
    };
    try {
      final response = await dioInterceptor.post(JAPI.urlGetInterviewDetails,
          data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> createInterview(
    String jobSuccessID,
    String date,
    String time,
    String place,
    String room,
    String interviewer,
    String skin,
    String doc,
    String requirement,
  ) async {
    Map<dynamic, dynamic> param = {
      "jobSuccessID": jobSuccessID,
      "date": date,
      "time": time,
      "place": place,
      "room": room,
      "interviewer": interviewer,
      "skin": skin,
      "doc": doc,
      "requirement": requirement,
    };
    try {
      final response = await dioInterceptor.post(JAPI.urlCreateInterview,
          data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> changeAvatar(File image) async {
    FormData formData =
        FormData.fromMap({'avatar': await MultipartFile.fromFile(image.path)});
    try {
      final response =
          await dioInterceptor.post(JAPI.urlChangeAvatar, data: formData);
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> inviteJob(
      String jobID, String profileID, String enterpriseID) async {
    Map<dynamic, dynamic> param = {
      "jobID": jobID,
      "enterpriseID": enterpriseID,
      "profileID": profileID,
    };
    try {
      final response =
          await dioInterceptor.post(JAPI.urlInvite, data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> personalGetInvite(String profileID) async {
    Map<dynamic, dynamic> param = {
      "profileID": profileID,
    };
    try {
      final response = await dioInterceptor.post(JAPI.urlPersonalListInvite,
          data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> acceptInvite(String inviteID) async {
    Map<dynamic, dynamic> param = {
      "inviteID": inviteID,
    };
    try {
      final response = await dioInterceptor.post(JAPI.urlAcceptInvite,
          data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> denyInvite(String inviteID) async {
    Map<dynamic, dynamic> param = {
      "inviteID": inviteID,
    };
    try {
      final response = await dioInterceptor.post(JAPI.urlDenyInvite,
          data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> getJobWithID(String jobID) async {
    Map<dynamic, dynamic> param = {'jobID': jobID};
    try {
      final response =
          await dioInterceptor.post(JAPI.urlGetJobID, data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> personalListInterview(String profileID) async {
    Map<dynamic, dynamic> param = {
      "profileID": profileID,
    };
    try {
      final response = await dioInterceptor.post(JAPI.urlPersonalInterview,
          data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Response> getPInterviewDetails(String successID) async {
    Map<dynamic, dynamic> param = {
      "successID": successID,
    };
    try {
      final response = await dioInterceptor.post(JAPI.urlPInterviewDetails,
          data: jsonEncode(param));
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 404 || err.response?.statusCode == 400) {
        return Future.error(err.response?.data["message"]);
      } else {
        return Future.error("Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
        // return Future.error(err.message.toString());
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
