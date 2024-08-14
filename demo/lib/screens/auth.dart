import 'package:demo/screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethod {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signInWithGoogle() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken);

    UserCredential result =
        await FirebaseAuth.instance.signInWithCredential(credential);

    User? userDetails = result.user;

    if (result!=null) {
      Map<String,dynamic> userInfoMap={
        'email': userDetails!.email,
        'name': userDetails.displayName,
        'imgUrl':userDetails.photoURL,
        'id' : userDetails.uid
      };
    }
  }
}
