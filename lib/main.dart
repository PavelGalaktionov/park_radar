import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:park_radar/db/spots_db_operations.dart';
import 'package:park_radar/firebase_options.dart';
import 'package:park_radar/ui/app_primary_button.dart';
import 'package:park_radar/utils/utils_functions.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();

    _initApplication();
  }

  void _incrementCounter() {
    getTestMessage().then((val) => {
      printInfo("Zprava: ", val.docs[0].data().toString())
    });
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      floatingActionButton: AppPrimaryButton(
        onPressed: _incrementCounter,
        text: 'Increment',
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _initApplication() async {
    printInfo("INIT", "Zahajena inicializace aplikace.");

    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    //kontrola internetoveho pripojeni
    bool isOnline = await hasNetwork();
    if (!isOnline) {
      // showErrorDialogExitApplication(navigatorKey.currentContext!,
      //     navigatorKey.currentContext!.loc.notConnectedErrorTitle, navigatorKey.currentContext!.loc.notConnectedError);
      return;
    }

    requestPermission();

    //final status = await Permission.locationWhenInUse.request();

    // SavedUserData savedUserData = getIt<SavedUserData>();
    //Settings settings = new Settings(persistenceEnabled: true);

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    //FirebaseFirestore.instance.settings = settings;
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    // loadApplicationConfiguration().then((appConfiguration) => {
    //   reloadConfiguration(appConfiguration),
    //   loadFirebaseAdminConfiguration().then((adminConfiguration) => {_initFirebaseAdmin(adminConfiguration)})
    // });
    //
    // _auth = AuthService();
    // getIt<LoginHelper>().setAuthService(_auth!);
    // _auth?.user.first.then((value) async => {
    //   loggedInUserId = value?.uid,
    //   savedUserData.setId(loggedInUserId.toString()),
    //   inicialized = true,
    //   setState(() {
    //     printInfo("INIT", "Aplikace inicializovana! :)");
    //   }),
    // });
  }
}
