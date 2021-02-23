import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart' as lit;
import 'package:provider/provider.dart';
import 'package:sandtonchurchapp/screens/home.dart';
import 'package:sandtonchurchapp/services/auth.dart';
import 'package:sandtonchurchapp/services/database.dart';
import 'package:sandtonchurchapp/state/user_state.dart';
import 'constants/palette.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sandtonchurchapp/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(value: AuthService().user),
        StreamProvider<UserDetails>.value(value: DatabaseService().userDetails),
        ChangeNotifierProvider(create: (context) => UserState())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',  
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.muliTextTheme(),
          accentColor: Palette.darkOrange,
          appBarTheme: const AppBarTheme(
            brightness: Brightness.dark,
            color: Palette.darkBlue,
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
