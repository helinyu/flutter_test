import 'package:flutter/material.dart';

// void main() => runApp(MyApp()); // 基本的首页（常规）

void main() => runApp(FadeTest());

// 这个是关于点击，有动画效果的内容， 将animation添加到controller里面去； 
class FadeTest extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '动画',
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
      ),
        home : MyFadeTest(title: 'fade test'),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyFadeTest createState() => _MyFadeTest();
}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: curve,
            child: FlutterLogo(size: 100)
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: Icon(Icons.brush),
        onPressed: (){
          controller.forward();
        },
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


//  基本上阿敏的首页
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Default placeholder text
  bool toggle = true;
  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text("toggle one: ${toggle}");
    }
    else {
      return MaterialButton(
        onPressed: () {},
        child: Text('Toggle two: ${toggle}')
      );
    }
  }

  _getUpdateText() {
    return  _getToggleChild();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample1 App"),
      ),
      body: Center(
        child: _getUpdateText(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'update text',
        child: Icon(Icons.update),
      ),
    );
  }
}
