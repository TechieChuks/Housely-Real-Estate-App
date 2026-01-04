class OtpState {
  final List<String> otp;
  final int secondsRemaining;
  final bool canResend;

  OtpState({
    required this.otp,
    required this.secondsRemaining,
    required this.canResend,
  });

  bool get isOtpComplete => otp.every((e) => e.isNotEmpty);

  OtpState copyWith({
    List<String>? otp,
    int? secondsRemaining,
    bool? canResend,
  }) {
    return OtpState(
      otp: otp ?? this.otp,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      canResend: canResend ?? this.canResend,
    );
  }
}
