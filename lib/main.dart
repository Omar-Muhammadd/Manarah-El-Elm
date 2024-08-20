import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebaacademy/shared/cubit/cubit.dart';
import 'pages/home_page.dart';
import 'shared/cubit/states.dart';
import 'themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return MaterialApp(
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            home:  Directionality(
              textDirection: TextDirection.rtl,
              child: HomePage(),
            ),
          );
        },
      ),
    );
  }
}
