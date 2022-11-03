import 'package:flutter/material.dart';

import 'src/index/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const IndexScreen(),
    );
  }
  //   return MultiBlocProvider(
  //     providers: [
  //       BlocProvider(create: (_) => UserBloc()),
  //     ],
  //     child: MaterialApp(
  //       title: 'Flutter Bloc',
  //       theme: ThemeData(primarySwatch: Colors.blue),
  //       home: const IndexScreen(),
  //     ),
  //   );
  // }
}
