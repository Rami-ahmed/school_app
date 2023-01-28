import 'package:flutter/material.dart';
import 'package:school_app_22/screens/add_notes.dart';
import 'package:school_app_22/screens/pages/home.dart';
import 'package:sizer/sizer.dart';
import 'core/res/color.dart';
import 'core/routes/routes.dart';
import 'screens/classes_scr/add_classes.dart';
import 'screens/classes_scr/classes_screen.dart';
import 'screens/markers/add_markers.dart';
import 'screens/markers/markers_screen.dart';
import 'screens/students/add_student.dart';
import 'screens/students/students_screen.dart';
import 'screens/subjects/add_subject.dart';
import 'screens/subjects/subjects_screen.dart';
import 'screens/teachers/add_teacher.dart';
import 'screens/teachers/teachers_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Task Management',
        debugShowCheckedModeBanner: false,
        theme: AppColors.getTheme,
        initialRoute: Routes.onBoarding,
        onGenerateRoute: RouterGenerator.generateRoutes,
      );
    });
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Sizer(builder: (context, orientation, deviceType) {
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'school app',
//         routes: {
//           "addclass": (context) => const AddClass(),
//           "classscreen": (context) => const ClassesScreen(),
//           "addmarker": (context) => const AddMarkers(),
//           "markersscreen": (context) => const MarkersScreen(),
//           "addstudent": (context) => const AddStudents(),
//           "studentsscreen": (context) => const StudentsScreen(),
//           "addsubject": (context) => const AddSubject(),
//           "subjectsscreen": (context) => const SubjectsScreen(),
//           "addteacher": (context) => const AddTeachers(),
//           "teachersscreen": (context) => const TeachersScreen(),
//           "homepage": (context) => const Home(),
//         },
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const Home(),
//       );
//     });

//     ;
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
