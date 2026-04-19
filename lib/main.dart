import 'package:depi_five/old_apps/counter/counter_screen.dart';
import 'package:depi_five/old_apps/note/cubit/cubit/note_cubit.dart';
import 'package:depi_five/old_apps/note/note_hive_helper.dart';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cubit/cubit/counter_cubit.dart';
import 'ecommerce_app/core/helpers/hive_helper.dart';
import 'ecommerce_app/features/splash/splash_screen.dart';
import 'old_apps/bmi_calc.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child:  MaterialApp(home: MyHome()),
    );
  }
}


class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CounterCubit>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: cubit.increaseCount,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Icon(Icons.menu),
        centerTitle: true,
        title: Text("AppBar"),
        actions: [Icon(Icons.search)],
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Center(
            child: Text(cubit.getCount().toString(), style: TextStyle(fontSize: 50)),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
