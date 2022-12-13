import 'package:fashion_alley/loadingScreen.dart';
import 'package:fashion_alley/homeScreen.dart';
import 'package:fashion_alley/urun.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const LoginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Giriş fonksiyonu
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        //bu maille kullanıcı bulunamadı
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    //controller yaratma
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Container(
      color: Color(0xFFFDF8F8),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 44.0,
            ),
            Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.contain,
              height: 220,
              width: 200,
            ),
            const Text(
              "Giriş yap",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 44.0,
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "e-mail",
                prefixIcon: Icon(Icons.mail, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 26.0,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "şifre",
                prefixIcon: Icon(Icons.lock, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {},
                child: const Text(
                  'Şifrenizi mi unuttunuz?',
                  style: TextStyle(
                      color: Color(0x96000000),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: Color(0x96000000),
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () async {
                  //test etme
                  User? user = await loginUsingEmailPassword(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context);
                  if (user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const homeScreen()));
                  }
                },
                child: const Text(
                  "Giriş",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0, //asfg
                  ),
                ),
              ),
            ),
            /*SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: const Color(0xFFD91515),
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () async {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const GScreen()));
                },
                child: const Text(
                  "Diğer sayfa",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
