import 'package:calendar_app/cubit/login_cubit/Login_states.dart';
import 'package:calendar_app/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(IntialLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool hiddenPass = true;
  void makeThePassecure() {
    hiddenPass = !hiddenPass;
    emit(HiddenPassState());
  }

  UserModel? model;
  void getuserdata(var uid) {
    emit(InitialgetuserState());
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      model = UserModel.fromjson(value.data()!);
      emit(SuccessgetuserState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(ErrorgetuserState());
    });
  }

  //Register
  void registerNewUser(
      {required String email,
      required String password,
      required String phone,
      required String name}) {
    emit(RegisterloadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createNewUser(
        email: email,
        uid: value.user!.uid,
        phone: phone,
        name: name,
      );
      emit(RegistersuccessfullState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(RegistererrorState(error.toString()));
    });
  }

  void createNewUser(
      {required String email,
      String? uid,
      required String phone,
      required String name}) {
    UserModel umodel = UserModel(
      email: email,
      name: name,
      phone: phone,
      uid: uid,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(umodel.tomap())
        .then((value) {})
        .catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(RegistererrorState(error.toString()));
    });
  }

  //Login
  void loginUser({required String email, required String password}) {
    emit(LoginloadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(LoginsuccessfullState(value.user!.uid));
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(LoginerrorState(error.toString()));
    });
  }

  void updateusertype({required String usertype}) {
    emit(UpdateloadingrState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(model!.uid)
        .update({'usertype': usertype}).then((value) {
      emit(UpdateSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(UpdateerrorState());
    });
  }

  void resetpassword(String email) {
    emit(LoadingResetPassState());
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
      emit(SuccessResetPassState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorResetPassState());
    });
  }
}
