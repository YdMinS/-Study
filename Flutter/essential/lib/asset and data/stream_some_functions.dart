import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(StreamSomeFunctionApp());
}

class StreamSomeFunctionApp extends StatelessWidget {
  subscriptionTest() {
    var stream = Stream.fromIterable([1, 2, 3]);
    StreamSubscription subscription = stream.listen(null);

    subscription.onData((data) {
      print('value : ${data}');
    });

    subscription.onError((error) {
      print('error : ${error}');
    });

    subscription.onDone(() {
      print('stream done');
    });
  }

  controllerTest() {
    var controller = StreamController();

    var stream1 = Stream.fromIterable([1, 2, 3]);
    var stream2 = Stream.fromIterable(['A', 'B', 'C']);

    stream1.listen((value) {
      controller.add(value);
    });
    stream2.listen((value) {
      controller.add(value);
    });

    controller.stream.listen((value) {
      print('in controller $value');
    });
  }

  transformerTest() {
    var stream = Stream.fromIterable([1, 2, 3]);

    StreamTransformer<int, dynamic> transformer =
        StreamTransformer.fromHandlers(handleData: (value, sink) {
      print('in transformer : $value');
      sink.add(value * value);
    });

    stream.transform(transformer).listen((value) {
      print('in listen : $value');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Stream Some Function App',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('subscription'),
                onPressed: subscriptionTest,
              ),
              ElevatedButton(
                child: Text('controller'),
                onPressed: controllerTest,
              ),
              ElevatedButton(
                child: Text('transformer'),
                onPressed: transformerTest,
              )
            ],
          ),
        ),
      ),
    );
  }
}
