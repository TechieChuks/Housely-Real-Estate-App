import 'dart:async';
import 'otp_state.dart';

class OtpController {
  late OtpState state;
  late void Function() notify;

  Timer? _timer;

  OtpController(this.notify) {
    state = OtpState(
      otp: List.filled(4, ''),
      secondsRemaining: 60,
      canResend: false,
    );
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.secondsRemaining == 0) {
        timer.cancel();
        state = state.copyWith(canResend: true);
      } else {
        state = state.copyWith(secondsRemaining: state.secondsRemaining - 1);
      }
      notify();
    });
  }

  void updateOtp(int index, String value) {
    final newOtp = List<String>.from(state.otp);
    newOtp[index] = value;
    state = state.copyWith(otp: newOtp);
    notify();
  }

  void resendCode() {
    state = state.copyWith(
      secondsRemaining: 60,
      canResend: false,
      otp: List.filled(4, ''),
    );
    _startTimer();
    notify();
  }

  void dispose() {
    _timer?.cancel();
  }
}
