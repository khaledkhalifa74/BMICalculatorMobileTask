import 'package:bmi_task/features/Authentication/manager/auth_cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bmi_task/core/utils/globals.dart' as globals;

class AuthCubit extends Cubit<AuthState>{
  AuthCubit() : super (AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  Future<void> loginUser({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
      if (kDebugMode) {
        print(userCredential.user?.uid);
      }
      if(userCredential.user?.uid != null){
        globals.userId = userCredential.user!.uid;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'User not found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errorMessage: 'Wrong password'));
      }
    }
    on Exception catch (e) {
      emit(LoginFailure(errorMessage: 'Something went wrong'));
    }
  }

  Future<void> registerUser({required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
      if (kDebugMode) {
        print(userCredential.user?.uid);
      }
      if(userCredential.user?.uid != null){
        globals.userId = userCredential.user!.uid;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errorMessage: 'The password provided is too weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMessage: 'The account already exists for that email'));
      }
    }
    on Exception catch (e) {
      emit(RegisterFailure(errorMessage: 'Something went wrong'));
    }
  }

  Future<void> logoutUser() async {
    emit(LogoutLoading());
    try {
      await FirebaseAuth.instance.signOut();
      emit(LogoutSuccess());
    }
    on Exception catch (e) {
      emit(LogoutFailure(errorMessage: 'Something went wrong'));
    }
  }

  IconData passwordVisible = Icons.visibility_outlined;
  bool isPasswordShown = false;

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    passwordVisible = isPasswordShown
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(ChangePasswordVisibility());
  }
}