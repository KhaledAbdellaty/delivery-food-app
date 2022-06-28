import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

abstract class UserRemoteDataSources {
  Future<UserDataModel> createUser(String email, String password, String name);
  Future<UserCredential> signIn(String email, String password);
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String userId);
}

class UserRemoteDataSourcesImp implements UserRemoteDataSources {
  UserRemoteDataSourcesImp._();
  static final UserRemoteDataSourcesImp instance = UserRemoteDataSourcesImp._();
  final auth = FirebaseAuth.instance;
  @override
  Future<UserDataModel> createUser(
      String email, String password, String name) async {
    final newUser = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (newUser.user!.displayName == null) {
      newUser.user!.updateDisplayName(name);
    }
    final UserDataModel user = UserDataModel(
        id: newUser.user!.uid,
        name: name,
        email: newUser.user!.email!,
        password: password,
        memberSince: newUser.user!.metadata.creationTime.toString(),
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/e-commerce-dfc20.appspot.com/o/images%2Fusers%2Fdefault_user_image.jpg?alt=media&token=503f5a40-8633-4747-9f4f-16ad07174451');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(newUser.user!.uid)
        .set(
          user.toJson(),
        );

    return user;
  }

  @override
  Future<UserCredential> signIn(String email, String password) async {
    final user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return user;
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String userId) async {
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return userData;
  }
}
