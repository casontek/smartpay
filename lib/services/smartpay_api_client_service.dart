
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
              Status.success,
              tokenResponse
          );
        }
        else {
          final message = responseData['message'] as String?;
          return Result(
              message ?? 'failed.',
              Status.failed,
              null
          );
        }
      }
      else {
        return Result(
            'request failed.',
            Status.failed,
            null
        );
      }
    }
    catch(e) {
      return Result(
          'Network issue. try again!',
          Status.timeout,
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
              Status.success,
              emailResponse
          );
        }
        else {
          final message = responseData['message'] as String?;
          return Result(
              message ?? 'failed.',
              Status.failed,
              null
          );
        }
      }
      else {
        return Result(
            'request failed.',
            Status.failed,
            null
        );
      }
    }
    catch(e) {
      return Result(
          'Network issue. try again!',
          Status.timeout,
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
              Status.success,
              response
          );
        }
        else {
          final message = responseData['message'] as String?;
          return Result(
              message ?? 'failed.',
              Status.failed,
              null
          );
        }
      }
      else {
        return Result(
            'request failed.',
            Status.failed,
            null
        );
      }
    }
    catch(e) {
      return Result(
          'Network issue. try again!',
          Status.timeout,
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

      if(response.statusCode == 200) {
        final responseData = jsonDecode(response.body) as Map;
        final message = responseData['message'] as String;

        if(message == 'success') {
          final data = responseData['data'] as Map<String, dynamic>;
          final response = RegistrationResponse.fromJson(data);

          return Result(
              message,
              Status.success,
              response
          );
        }
        else {
          final message = responseData['message'] as String?;
          return Result(
              message ?? 'failed.',
              Status.failed,
              null
          );
        }
      }
      else {
        return Result(
            'request failed.',
            Status.failed,
            null
        );
      }
    }
    catch(e) {
      return Result(
          'Network issue. try again!',
          Status.timeout,
          null
      );
    }
  }

}