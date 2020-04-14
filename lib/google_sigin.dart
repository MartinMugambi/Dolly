import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qwetu/navigation_drawer.dart';

class SocialSignin extends StatefulWidget {
  @override
  _SocialSiginState createState() => _SocialSiginState();
  static final String id = 'social_sign';
}

class _SocialSiginState extends State<SocialSignin> {
  FirebaseAuth _auth =FirebaseAuth.instance;
  FirebaseUser _user;
  GoogleSignIn _googleSignIn = new GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isSignin ? Center(
        child: Column(
          children: <Widget>[
             
          ],
        ),

      ) : Center(
        child: OutlineButton(
          onPressed: (){
              handleSignIn();
        },
        child: Text('Sigin with Google'),
        ),
      ), 
    );
  }
   bool isSignin = false;
  Future<void> handleSignIn()  async{
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken, 
      accessToken: googleSignInAuthentication.accessToken,
      );
      AuthResult result = (await _auth.signInWithCredential(credential));
      _user = result.user;

      setState(() {
        isSignin = true;
        Navigator.pushReplacementNamed(context, MenuOptionsScreen.id);

      });
  }
  Future<void> googleSignout() async{
    await _auth.signOut().then((onValue){
      
       _googleSignIn.signOut();
       setState(() {
         isSignin = false;
       });
    });
  }
}