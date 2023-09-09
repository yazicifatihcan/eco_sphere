import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../constants/enum/type_enum.dart';
import '../../model/response/user_info_model.dart';

class FirebaseAuthManager {
  final firabaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await firabaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'Please enter stronger password.';
      } else if (e.code == 'email-already-in-use') {
        throw 'Email is already registered';
      } else {
        throw 'An error occured during register.';
      }
    } catch (e) {
      throw 'An error occured during register.';
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await firabaseAuth.signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw 'Wrong credentials.';
      } else {
        throw 'An error occured during login.';
      }
    } catch (e) {
      throw 'An error occured during login.';
    }
  }

  Future<void> saveUserToFirebase(UserInfoModel userInfo) async {
    try {
      final userDoc =
          await FirebaseFirestore.instance.collection(FirebaseTablesEnum.USERS.name).doc(userInfo.uuid).get();
      if (!userDoc.exists) {
        await FirebaseFirestore.instance
            .collection(FirebaseTablesEnum.USERS.name)
            .doc(userInfo.uuid)
            .set(userInfo.toJson());
      }
    } catch (e) {
      throw 'An error occured during register.';
    }
  }

  Future<UserInfoModel> getUserInfoFromFirebase(String uuid) async {
    try {
      final userDoc = await FirebaseFirestore.instance.collection(FirebaseTablesEnum.USERS.name).doc(uuid).get();

      return UserInfoModel.fromJson(userDoc.data()!);
    } catch (e) {
      throw 'An error occured.';
    }
  }

  Future<UserCredential?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? result = await GoogleSignIn().signIn();
      if (result != null) {
        final GoogleSignInAuthentication googleAuth = await result.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        return await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        throw Exception('Google Sign-In failed: User cancelled operation');
      }
    } catch (e) {
      throw 'An error occurred while signing in with Google';
    }
  }

  Future<UserInfoModel> generateUserInfoModelFromCredential(
      UserCredential userCredential, SignUpWaysEnum signUpWay) async {
    return UserInfoModel(
      signUpWay: signUpWay.name,
      dateCreated: DateTime.now().toString(),
      savedCo2: 0,
      userActivities: [],
      email: userCredential.user!.email,
      isBanned: false,
      profileImageUrl: userCredential.user!.photoURL,
      uuid: userCredential.user!.uid,
    );
  }

  /// Apple ile login olma
  // String generateNonce([int length = 32]) {
  //   const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  //   final random = Random.secure();

  //   return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  // }

  // String sha256ofString(String input) {
  //   final bytes = utf8.encode(input);
  //   final digest = sha256.convert(bytes);

  //   return digest.toString();
  // }

  // Future<UserCredential?> signInWithApple() async {
  //   try {
  //     final rawNonce = generateNonce();
  //     final nonce = sha256ofString(rawNonce);

  //     final appleCredential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //       nonce: nonce,
  //     );

  //     final oauthCredential = OAuthProvider('apple.com').credential(
  //       idToken: appleCredential.identityToken,
  //       rawNonce: rawNonce,
  //     );

  //     return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  //   } on SignInWithAppleAuthorizationException catch (e) {
  //     if (e.code == AuthorizationErrorCode.canceled) {
  //       return null;
  //     } else {
  //       rethrow;
  //     }
  //   } catch (e) {
  //     throw AppLocalization.getLabels.defaultErrorMessage;
  //   }
  // }

  // Future<UserCredential?> signInWithFacebook() async {
  //   try {
  //     final LoginResult loginResult = await FacebookAuth.instance.login();
  //     if (loginResult.accessToken != null) {
  //       final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //       return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<UserCredential?> loginAnonymously() async {
  //   try {
  //     final UserCredential user = await FirebaseAuth.instance.signInAnonymously();

  //     return user;
  //   } catch (e) {
  //     throw AppLocalization.getLabels.defaultErrorMessage;
  //   }
  // }
}
