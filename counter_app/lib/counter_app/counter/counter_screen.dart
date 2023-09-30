// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:counter_app/counter_app/counter/cubit/cubit.dart';
import 'package:counter_app/counter_app/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class counterscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {
          if (state is CounterMinusState) print('minus state ${state.counter}');
          if (state is CounterPlusState) print('plus state ${state.counter}');
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Counter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      CounterCubit.get(context).plus();
                    },
                    icon: const Icon(Icons.add),
                    color: Colors.blue,
                    iconSize: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          CounterCubit.get(context).plus();
                        },
                        icon: const Icon(Icons.add),
                        color: Colors.blue,
                        iconSize: 60,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Text(
                          '${CounterCubit.get(context).counter}',
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      IconButton(
                        onPressed: () {
                          CounterCubit.get(context).Minus();
                        },
                        icon: const Icon(Icons.remove),
                        color: Colors.blue,
                        iconSize: 60,
                      ),
                    ],
                  ),
                  IconButton(
                    focusColor: Colors.black,
                    onPressed: () {
                      CounterCubit.get(context).Minus();
                    },
                    icon: const Icon(Icons.remove),
                    color: Colors.blue,
                    iconSize: 60,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
