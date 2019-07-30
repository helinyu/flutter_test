import 'package:flutter/material.dart';

// void main() => runApp(MyApp()); // 基本的首页（常规）
// void main() => runApp(FadeTest()); // 渐变动画
// void main() => runApp(DemoApp());
// void main() => runApp(MaterialApp(home: DemoApp()));
void main() => runApp(Painter());

//  绘制原型和正方形
// Flutter
// 在Flutter中，你可以使用 CustomPaint 和 CustomPainter 类去绘制到画布。
// 以下示例显示如何使用CustomPaint widget在绘制阶段绘制。 它实现了抽象类CustomPainter，并将其传递给CustomPaint的painter属性。 CustomPaint子类必须实现paint和shouldRepaint方法：

class Painter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '绘制正放心和长方形',
      theme: ThemeData.fallback(),
      home: _MyCanvas(),
    );
  }
}

class CustomCanvasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.amber;
    canvas.drawCircle(Offset(100.0 ,200.0), 40.0, paint);

    Paint paintRect = Paint();
    paintRect.color = Colors.lightBlue;
    Rect rect = Rect.fromPoints(Offset(150.0, 300.0), Offset(300.0, 400.0));
    canvas.drawRect(rect, paintRect);
  }

  bool shouldRepaint(CustomCanvasPainter oldDelegate) => false;
  bool shouldRebuildSemantics(CustomCanvasPainter oldDelegate) => false;
}

class _MyCanvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
          painter: CustomCanvasPainter(),
      ),
    );
  }
}


// class _MyCanvas extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomPaint(
//         painter: CustomCanvasPainter(),
//       ),
//     );
//   }
// }

//  前面的渲染例子 , 自定义画布的实现方式
class DemoApp extends StatelessWidget {
    Widget build(BuildContext context) => Scaffold(body: Signature());
}

class Signature extends StatefulWidget {
  // SignatureState({Key key}) : super(key: key);
  SignatureState createState() => SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition =
          referenceBox.globalToLocal(details.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: CustomPaint(painter: SignaturePainter(_points), size: Size.infinite),
    );
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);
  final List<Offset> points;
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

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
