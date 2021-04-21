import 'package:admin_sharebook/model/admin_model.dart';
import 'package:admin_sharebook/status/status.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminRespository {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<Status> loginUSer({AdminModel adminModel}) async {
    try {
      User user = (await _auth.signInWithEmailAndPassword(
        email: adminModel.email,
        password: adminModel.password,
      ))
          .user;
      if (user.uid != null) {
        return Status(message: "Success", isSuccess: true, data: user);
      } else {
        return Status(message: "Could not Login", isSuccess: false, data: null);
      }
    } catch (e) {
      return Status(message: e.message, isSuccess: false, data: null);
    }
  }
}
