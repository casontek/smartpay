
import 'dart:convert';
import 'package:smartpaymobile/models/request/email_request_body.dart';
import 'package:smartpaymobile/models/request/email_verification_request_body.dart';
import 'package:smartpaymobile/models/request/login_request_body.dart';
import 'package:smartpaymobile/models/request/registration_request_body.dart';
import 'package:smartpaymobile/models/response/email_response.dart';
import 'package:smartpaymobile/models/response/token_response.dart';
import 'package:http/http.dart' as http;

import '../models/response/registration_response.dart';
import '../utils/constants.dart';
import '../utils/request_result.dart';

class SmartpayApiClientService {

  Future<Result<TokenResponse>> getEmailToken(EmailRequestBody body) async {
    try {
      final response = await http.post(
          Uri.parse('https://$baseUrl/api/v1/auth/email'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body)
      );
      if(response.statusCode == 200) {
        final responseData = jsonDecode(response.body) as Map;
        final message = responseData['message'] as String;
        if(message == 'success') {
          final data = responseData['data'] as Map<String, dynamic>;
          final tokenResponse = TokenResponse.fromJson(data);

          return Result(
              message,
              NetworkStatus.success,
              tokenResponse
          );
        }
        else {
          return Result(
              message,
              NetworkStatus.failed,
              null
          );
        }
      }
      else {
        String error;
        try {
          final errorData = jsonDecode(response.body) as Map;
          error = errorData['message'] as String;
        }
        catch(e) {
          error = 'Request failed. try again!';
        }
        return Result(
            error,
            NetworkStatus.failed,
            null
        );
      }
    }
    catch(e) {
      return Result(
          'Network issue. try again!',
          NetworkStatus.timeout,
          null
      );
    }
  }

  Future<Result<EmailResponse>> verifyEmailToken(EmailVerificationBody body) async {
    try {
      final response = await http.post(
          Uri.parse('https://$baseUrl/api/v1/auth/email/verify'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body)
      );

      if(response.statusCode == 200) {
        final responseData = jsonDecode(response.body) as Map;
        final message = responseData['message'] as String;

        if(message == 'success') {
          final data = responseData['data'] as Map<String, dynamic>;
          final emailResponse = EmailResponse.fromJson(data);

          return Result(
              message,
              NetworkStatus.success,
              emailResponse
          );
        }
        else {
          return Result(
              message,
              NetworkStatus.failed,
              null
          );
        }
      }
      else {
        String error;
        try {
          final errorData = jsonDecode(response.body) as Map;
          error = errorData['message'] as String;
        }
        catch(e) {
          error = 'Request failed. try again!';
        }
        return Result(
            error,
            NetworkStatus.failed,
            null
        );
      }
    }
    catch(e) {
      return Result(
          'Network issue. try again!',
          NetworkStatus.timeout,
          null
      );
    }
  }

  Future<Result<RegistrationResponse>> registerProfile(RegistrationRequestBody body) async {
    try {
      final response = await http.post(
          Uri.parse('https://$baseUrl/api/v1/auth/register'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body)
      );

      if(response.statusCode == 200) {
        final responseData = jsonDecode(response.body) as Map;
        final message = responseData['message'] as String;

        if(message == 'success') {
          final data = responseData['data'] as Map<String, dynamic>;
          final response = RegistrationResponse.fromJson(data);

          return Result(
              message,
              NetworkStatus.success,
              response
          );
        }
        else {
          return Result(
              message ?? 'failed.',
              NetworkStatus.failed,
              null
          );
        }
      }
      else {
        String error;
        try {
          final errorData = jsonDecode(response.body) as Map;
          error = errorData['message'] as String;
        }
        catch(e) {
          error = 'Request failed. try again!';
        }
        return Result(
            error,
            NetworkStatus.failed,
            null
        );
      }
    }
    catch(e) {
      print('@@@@@@@@@@@@@@@@@@@@@@@@ Error: $e');
      return Result(
          'Network issue. try again!',
          NetworkStatus.timeout,
          null
      );
    }
  }

  Future<Result<RegistrationResponse>> userLogin(LoginRequestBody body) async {
    try {
      final response = await http.post(
          Uri.parse('https://$baseUrl/api/v1/auth/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body)
      );

      print('@@@@@@@@@@@@@@@@@@@@@@@@@@@ Login Result: ${response.body}');

      if(response.statusCode == 200) {
        final responseData = jsonDecode(response.body) as Map;
        final message = responseData['message'] as String;

        if(message == 'success') {
          final data = responseData['data'] as Map<String, dynamic>;
          final response = RegistrationResponse.fromJson(data);

          return Result(
              message,
              NetworkStatus.success,
              response
          );
        }
        else {
          final message = responseData['message'] as String?;
          return Result(
              message ?? 'failed.',
              NetworkStatus.failed,
              null
          );
        }
      }
      else {
        String error;
        try {
          final errorData = jsonDecode(response.body) as Map;
          error = errorData['message'] as String;
        }
        catch(e) {
          error = 'Request failed. try again!';
        }
        return Result(
            error,
            NetworkStatus.failed,
            null
        );
      }
    }
    catch(e) {
      return Result(
          'Network issue. try again!',
          NetworkStatus.timeout,
          null
      );
    }
  }

}