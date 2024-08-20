import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tebaacademy/pages/bottom_nav_pages/open_learn.dart';
import 'package:tebaacademy/pages/bottom_nav_pages/open_learn_math.dart';
import 'package:tebaacademy/shared/cubit/cubit.dart';
import 'package:tebaacademy/shared/cubit/states.dart';


Color C = const Color.fromRGBO(64, 123, 255, 1);

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.blueAccent.withOpacity(.9),
                centerTitle: true,
                title: Text(
                  'منارة العلم',
                      style: TextStyle(
                        color: Colors.white,
                    fontSize: 20,
                ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OpenLearn()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12)
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: C.withOpacity(0.3),
                                spreadRadius: 0.2,
                                blurRadius: 7,
                                offset: const Offset(4, 7),
                              ),
                              BoxShadow(
                                color: C.withOpacity(0.3),
                                spreadRadius: 0.2,
                                blurRadius: 4,
                                offset: const Offset(-4, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Container(
                                 child: Text(
                                   'تعلم',
                                   style: TextStyle(
                                     letterSpacing: 2,
                                     fontWeight: FontWeight.normal,
                                     fontSize: 15,
                                      color: Colors.white,
                                   ),
                                 ),
                                 padding: const EdgeInsets.only(
                                   top: 6,
                                   bottom: 12,
                                   right: 15,
                                   left: 15,
                                 ),
                                 decoration: BoxDecoration(
                                   color: Colors.blueAccent.withOpacity(.9),
                                   borderRadius: const BorderRadius.vertical(
                                     bottom: Radius.circular(12),
                                   ),
                                 ),
                               ),
                                Padding(
                                padding:  EdgeInsets.only(
                                  top: 10,
                                  right: 15,
                                  bottom: 4,
                                ),
                                child: Text(
                                  'اللغة العربية',
                                  style:  TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                               SizedBox(
                                height: 12,
                              ),
                              Image.asset('assets/image/11.png'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OpenLearnMath()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [

                              BoxShadow(
                                color: C.withOpacity(0.3),
                                spreadRadius: 0.2,
                                blurRadius: 7,
                                offset: const Offset(4, 7),
                              ),

                              BoxShadow(
                                color: C.withOpacity(0.3),
                                spreadRadius: 0.2,
                                blurRadius: 4,
                                offset: const Offset(-4, 1),
                              ),

                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'تعلم',
                                        style: TextStyle(
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),


                                      padding: const EdgeInsets.only(
                                        top: 6,
                                        bottom: 12,
                                        right: 15,
                                        left: 15,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent.withOpacity(.9),
                                        borderRadius: const BorderRadius.vertical(
                                          bottom: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                     Padding(
                                      padding:  EdgeInsets.only(
                                        top: 10,
                                        right: 15,
                                        bottom: 4,
                                      ),
                                      child: Text(
                                        'الرياضيات',
                                        style:  TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                     SizedBox(
                                      height: 12,
                                    ),
                                    Image.asset('assets/image/22.jpg'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

