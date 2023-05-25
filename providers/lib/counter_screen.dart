import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.watch<CounterProvider>().count.toString(),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Icon(Icons.add),
                onPressed: () => context.read<CounterProvider>().increase(),
              ),
              const SizedBox(width: 40),
              ElevatedButton(
                child: const Icon(Icons.remove),
                onPressed: () => context.read<CounterProvider>().decrease(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
