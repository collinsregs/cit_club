import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FlutterResources extends StatefulWidget {
  const FlutterResources({super.key});

  @override
  State<FlutterResources> createState() => _FlutterResourcesState();
}

class _FlutterResourcesState extends State<FlutterResources> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('F L U T T E R   M A T E R I A L S'),
      ),
      body: ListView(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Flutter Basics: An Introduction to App Development',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[800]),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  strutStyle: const StrutStyle(height: 1.8),
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Flutter is an open-source mobile application development framework created by Google. It is used to build high-performance, cross-platform applications for Android, iOS, and web platforms. Flutter uses the Dart programming language and offers a rich set of pre-built widgets that can be used to build beautiful and responsive user interfaces.\n\n'),
                      TextSpan(
                          text:
                              'In this article, we will cover the basics of Flutter and get you started with building your first Flutter app.\n')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Installation',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[800]),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  strutStyle: const StrutStyle(height: 1.8),
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Before we get started with building our first Flutter app, we need to set up our development environment. Here are the steps to install Flutter:\n\n'),
                      TextSpan(
                          text:
                              'Download the Flutter SDK from the official website (https://flutter.dev/docs/get-started/install).\n\n'),
                      TextSpan(
                          text:
                              "Extract the downloaded archive file to a suitable location.\n\nAdd the Flutter SDK's bin directory to your system path. \n\nRun the "),
                      TextSpan(
                          text: '"flutter doctor"',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              ' command to check if Flutter is installed correctly and to verify that your system is set up for Flutter development.\n')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Creating Your First Flutter App',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[800]),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  strutStyle: const StrutStyle(height: 1.8),
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Now that we have set up our development environment, we can create our first Flutter app. Here are the steps to create a new Flutter app:\n\nOpen Android Studio and select "Start a new Flutter project" from the welcome screen.\n\nChoose "Flutter Application" as the project type and give your project a name.\n\nSelect a suitable location for your project and click "Finish".\n\nWait for Android Studio to create the project and install any required dependencies.\n\nOnce the project is created, you can run it by clicking the "Run" button in the Android Studio toolbar.\n'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Understanding the Project Structure',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[800]),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  strutStyle: const StrutStyle(height: 1.8),
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              "Before we dive into the code, let's take a quick look at the project structure of a Flutter app. Here's what you should see in your project:\n\nThe 'lib' directory contains the main source code of your app.\nThe 'android' directory contains the Android-specific code of your app.\nThe 'ios' directory contains the iOS-specific code of your app.\nThe 'pubspec.yaml' file is used to manage the dependencies of your app.\n"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Building the User Interface',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[800]),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  strutStyle: const StrutStyle(height: 1.8),
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              "Now that we have our project set up, let's build the user interface of our app. Flutter comes with a rich set of pre-built widgets that can be used to create beautiful and responsive user interfaces. Here's a simple example that shows how to build a text widget:\n\n"),
                    ],
                  ),
                ),
                Container(
                  height: 550,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                    child: RichText(
                      strutStyle: const StrutStyle(height: 1.8),
                      text: const TextSpan(
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  "import 'package:flutter/material.dart';\n\nvoid main() {\n  runApp(MyApp());\n}\nclass MyApp extends StatelessWidget {\n  @override\n  Widget build(BuildContext context) {\n      return MaterialApp(\n          home: Scaffold(\n            appBar: AppBar(\n              title: Text('Hello World'),\n              ),\n             body: Center(\n                  child: Text('Welcome to Flutter'),\n                ),\n            ),\n        );\n    }\n}"),
                        ],
                      ),
                    ),
                  ),
                ),
                RichText(
                  strutStyle: const StrutStyle(height: 1.8),
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              '\nIn this example, we use the "MaterialApp" widget to create a new Flutter app. We then use the "Scaffold" widget to define the basic structure of the app, which includes an app bar and a body. In the body, we use the "Center" widget to center the text widget that displays the welcome message.\n'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Runnig the App',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[800]),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  strutStyle: const StrutStyle(height: 1.8),
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'To run the app, simply click the "Run" button in the Android Studio toolbar. This will launch the app in an emulator or on a connected device. You should see the app running and displaying the welcome message.\n'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Conclusion',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[800]),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  strutStyle: const StrutStyle(height: 1.8),
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'In this article, we covered the basics of Flutter and got you started with building your first Flutter app. We looked at how to set up your development environment, create a new Flutter app, and build a simple user interface. With Flutter, you can create beautiful and responsive user interfaces for Android, iOS, and web platforms\n'),
                    ],
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
