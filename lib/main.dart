import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<Counter>(
        create: (context) => Counter(),
        child: MyHomePage(),
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int _value = 0;
  int get value => this._value;

  _increment() {
    _value++;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Flutter Provider Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WidgetCenterText(),
            WidgetNumText(),
          ],
        ),
      ),
      floatingActionButton: WidgetIncrementBtn(),
    );
  }
}

class WidgetIncrementBtn extends StatelessWidget {
  const WidgetIncrementBtn({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context, listen: false);
    return FloatingActionButton(
      onPressed: () => counter._increment(),
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}

class WidgetNumText extends StatelessWidget {
  const WidgetNumText({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(
      builder: (context, counter, _) {
        return Text(
          '${counter.value}',
          style: Theme.of(context).textTheme.headline,
        );
      },
    );
  }
}

class WidgetCenterText extends StatelessWidget {
  const WidgetCenterText({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text('You have pushed the button this many times:');
  }
}
