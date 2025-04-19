import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nascon_prep/screens/home/home.dart';
import 'package:nascon_prep/screens/login/login_page.dart';
import 'package:nascon_prep/screens/otp/otp_page.dart';

class AuthRepo {
  static String verId = "";
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static void verifyPhoneNumber(BuildContext context, String number) async {
    _firebaseAuth.setSettings(
      appVerificationDisabledForTesting: false,
      forceRecaptchaFlow: true,
    );
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+92$number',
      verificationCompleted: (PhoneAuthCredential credential) {
        signInWithPhoneNumber(
          context,
          credential.verificationId!,
          credential.smsCode!,
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        verId = verificationId;
        print("verficationId $verId");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) {
              return const OtpScreen();
            },
          ),
        );
        print("code sent");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  static void logoutApp(BuildContext context) async {
    await _firebaseAuth.signOut();
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => const LoginPage()),
    );
  }

  static void submitOtp(BuildContext context, String otp) {
    signInWithPhoneNumber(context, verId, otp);
  }

  static Future<void> signInWithPhoneNumber(
    BuildContext context,
    String verificationId,
    String smsCode,
  ) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);
      print(userCredential.user!.phoneNumber);
      print("Login successful");
      // TODO: Navigate to home page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ),
      );
    } catch (e) {
      print('Error signing in with phone number: $e');
    }
  }
}
