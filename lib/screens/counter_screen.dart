import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 18;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    if (counter > 0) {
      counter--;
    }
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize25 = TextStyle(fontSize: 25);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App Stateful'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Número de clicks',
              style: fontSize25,
            ),
            Text(
              '$counter',
              style: fontSize25,
            ),
            const Icon(
              Icons.favorite,
              color: Colors.blue,
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActions(
        increaseFn: increase,
        decreaseFn: decrease,
        resetFn: reset,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const CustomFloatingActions(
      {Key? key,
      required this.increaseFn,
      required this.decreaseFn,
      required this.resetFn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          onPressed: (() => decreaseFn()),
          backgroundColor: Colors.blue,
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: (() => resetFn()),
          backgroundColor: Colors.blue,
          child: const Icon(Icons.exposure_zero),
        ),
        FloatingActionButton(
          onPressed: (() => increaseFn()),
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
