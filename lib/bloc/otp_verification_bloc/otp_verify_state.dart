
import 'package:equatable/equatable.dart';
import 'package:smartpaymobile/models/user.dart';

import '../../utils/app_status.dart';

class OtpVerifyState extends Equatable {
  final String message;
  final Status status;
  final User? user;
  final String token;
  final int selectedBox;
  final bool hasCompleteOTP;
  final Map<int, String> otpCodes;

  const OtpVerifyState({
    this.message = '',
    this.user,
    this.token = '',
    this.selectedBox = 1,
    this.hasCompleteOTP = false,
    this.status = Status.initial,
    this.otpCodes = const {1: '',2: '', 3: '', 4: '', 5: ''}
  });

  OtpVerifyState copyWith({
    String? message,
    Status? status,
    User? user,
    String? token,
    int? selectedBox,
    bool? hasCompleteOTP,
    Map<int, String>? otpCodes
  }) {
    return OtpVerifyState(
      message: message ?? this.message,
      status: status ?? this.status,
      user: user ?? this.user,
      token: token ?? this.token,
      selectedBox: selectedBox ?? this.selectedBox,
      otpCodes: otpCodes ?? this.otpCodes,
      hasCompleteOTP: hasCompleteOTP ?? this.hasCompleteOTP
    );
  }


  @override
  List<Object?> get props => [message, status, otpCodes, selectedBox, hasCompleteOTP, user, token];

}