
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class BridgeTest extends StatefulWidget {

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<BridgeTest> {

  // 创建一个给native的channel (类似iOS的通知）
  static const methodChannel = const MethodChannel('com.pages.your/native_get');

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;

      print('flutter的log打印：现在输出count=$_counter');
      // 余数为0的时候给客户端发参数
      if((_counter%3) == 0) {
        _toNativeSomethingAndGetInfo();
      }

      // 余数为1的时候给客户端发参数
      if((_counter%3) == 1) {
          Map<String, String> map = { "title": "这是一条来自flutter的参数" };
        dynamic result = methodChannel.invokeMethod('toNativePush',map);
        print("lt- result 1 : $result"); // 请求返回的是一个future的数据结构
        result.then((str){
          print('lt- result 1: string  : $str ');
        });
      }

      // 余数为2的时候给客户端发参数
      if((_counter%3) == 2) {
        Map<String, dynamic> map = { "content": "flutterPop回来","data":[1,2,3,4,5]};
        dynamic result = methodChannel.invokeMethod('toNativePop',map);
        print("lt- result 2 : $result");
      }
    });
  }

// 给客户端发送一些东东 , 并且拿到一些东东
  Future<Null> _toNativeSomethingAndGetInfo() async {
    dynamic result;
    try {
      result = await methodChannel.invokeMethod('toNativeSomething','大佬你点击了$_counter下');
      print("lt- result 0 : $result");
    } on PlatformException {
      result = 100000;
    }
    setState(() {
      // 类型判断
      if (result is int) {
        _counter = result;
      }

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

