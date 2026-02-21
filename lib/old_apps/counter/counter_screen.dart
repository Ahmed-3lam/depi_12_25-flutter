import 'package:depi_five/old_apps/counter/cubit/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CounterCubit>();
    print("Rebuild");
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber),
      floatingActionButton: FloatingActionButton(
        onPressed: cubit.increment,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            print("Bloc Builder");
            return Text(
              cubit.count.toString(),
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
    );
  }
}
