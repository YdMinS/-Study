import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

void main() {
  runApp(StateControlUsingCubitApp());
}

class StateControlUsingCubitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('State Control Using Cubit App'),
        ),
        body: BlocProvider(
          create: (_) => CounterCubit(),
          child: WidgetA(),
        ),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CounterCubit>(context);
    return BlocBuilder<CounterCubit, int>(
      builder: (context, count) {
        return Container(
          color: Colors.deepPurpleAccent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cubit : $count',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  child: Text('increment'),
                  onPressed: () {
                    cubit.increment();
                  },
                ),
                ElevatedButton(
                  child: Text('decrement'),
                  onPressed: () {
                    cubit.decrement();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
