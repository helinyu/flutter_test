import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:practice/src/person.dart';
import 'src/person_service.dart';
// import 'package:path_provider/path_provider.dart';
import 'dart:io';
// import 'package:practice/src/HttpClient.dart';
import 'package:practice/src/BridgeTest.dart';

//  flutter 和native的交互
void main() => runApp(MaterialApp(home: BridgeTest()));

//  http reqeust
// void main() => runApp(HttpClient());

// path_provider
// class FillOPerationRoute extends StatefulWidget {
//   _FileOperationRouteState({Key key}) : super(key: key);

//   @override
//   _FileOperationRouteState createState() => new _FileOperationRouteState();
// }

// class _FileOperationRouteState extends state<FileOperationRoute>(
//   int _counter ;

//   @override
//   void initState() {
//     super.initState();
//  //从文件读取点击次数
//     _readCounter().then((int value) {
//       setState(() {
//         _counter = value;
//       });
//     });
//   }

//    Future<int> _readCounter() async {
//     try {
//       File file = await _getLocalFile();
//       // 读取点击次数（以字符串）
//       String contents = await file.readAsString();
//       return int.parse(contents);
//     } on FileSystemException {
//       return 0;
//     }
//   }

//   Future<Null> _incrementCounter() async {
//     setState(() {
//       _counter++;
//     });
//     // 将点击次数以字符串类型写到文件中
//     await (await _getLocalFile()).writeAsString('$_counter');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(title: new Text('文件操作')),
//       body: new Center(
//         child: new Text('点击了 $_counter 次'),
//       ),
//       floatingActionButton: new FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: new Icon(Icons.add),
//       ),
//     );
//   }
// ),


// void main() => runApp(AssetsJsonData(title: "haha"));

// class AssetsJsonData extends StatelessWidget {
//   String title;
//   //  这个是一个明明参数 ，要用大括号括起来；
//   AssetsJsonData({String title: '/d'}) {
//     // var a = loadAsset();
//     // print('json data : ${a}');
//     // Future<Person> personFuture = decodePerson();
//     // personFuture.then((person){
//     //   print('person : ${person}');
//     // });
//     decodePerson().then((person){
//       print('person :${person} ${person.firstName} + ${person.lastName} + ${person.email}');
//     });
//     // print('person : ${person}');
//     this.title = title;
//   }

//   Future<String> loadAsset() async {
//   return await rootBundle.loadString('my-assets/data.json');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Center(
//       child: new CustomButton(this.title),
//     );
//   }
// }



// // 导航与路由
// // void main() {
// //   runApp(MaterialApp(
// //     home: MyHomePage(),
// //     routes: <String, WidgetBuilder> {
// //       '/a': (BuildContext context) => MyPage(title: 'page A'),
// //       '/b': (BuildContext context) => MyPage(title: 'page B'),
// //       '/c': (BuildContext context) => MyPage(title: 'page C'),
// //       '/d': (BuildContext context) => MyPage(),
// //     },
// //   ));
// // }
// //  参数是怎么传的？

// class MyPage extends StatelessWidget {
//   String title;
//   //  这个是一个明明参数 ，要用大括号括起来；
//   MyPage({String title: '/d'}) {
//     this.title = title;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Center(
//       child: new CustomButton(this.title),
//     );
//   }
// }




// // pragma mark -- 下面是widget的练习

// // void main() => runApp(MyApp()); // 基本的首页（常规）
// // void main() => runApp(FadeTest()); // 渐变动画
// // void main() => runApp(DemoApp());
// // void main() => runApp(MaterialApp(home: DemoApp()));
// // void main() => runApp(Painter());
// // void main() => runApp(CustomBtnWidget());// 自定义界面 (获取了本地的json数据)

// // void main() {
// //   return runApp(CustomNetWidget());
// // }

// class CustomNetWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "网络请求",
//       theme: ThemeData.fallback(),
//       home: _CustomNetWidget(),
//     );
//   }
// }

// class _CustomNetWidget extends StatefulWidget {
//     @override
//     Widget build(BuildContext context) {
//     return new Center(
//       // child: new CustomButton("Hello"),
//     );
// }

// class CustomBtnWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '自定义wedgit',
//       theme: ThemeData.fallback(),
//       home: _CustomBtnWidget(),
//     );
//   }
// }

// class _CustomBtnWidget extends StatelessWidget {
//   //使用自定义组件
//   @override
//   Widget build(BuildContext context) {
//     return new Center(
//       child: new CustomButton("Hello"),
//     );
//   }
// }

// //  自定义widget
// // 在 Flutter 中，推荐组合多个小的 Widgets 来构建一个自定义的 Widget（而不是扩展它）。
// // 举个例子，如果你要构建一个 CustomButton ，并在构造器中传入它的 label？那就组合 RaisedButton 和 label，而不是扩展 RaisedButton。
// class CustomButton extends StatelessWidget {
//   final String label;
//   CustomButton(this.label);

//   @override
//   Widget build(BuildContext context) {
//     Future<Person> person = decodePerson();
//     // Person p = person.generator();
//     // print('person : ${person}');
//     decodePerson().then((person){
//       print('person :${person} ${person.firstName} + ${person.lastName} + ${person.email}');
//     });
//     return new RaisedButton(onPressed: () {}, child: new Text(label));
//   }
// }

// //  绘制原型和正方形
// // Flutter
// // 在Flutter中，你可以使用 CustomPaint 和 CustomPainter 类去绘制到画布。
// // 以下示例显示如何使用CustomPaint widget在绘制阶段绘制。 它实现了抽象类CustomPainter，并将其传递给CustomPaint的painter属性。 CustomPaint子类必须实现paint和shouldRepaint方法：

// class Painter extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '绘制正放心和长方形',
//       theme: ThemeData.fallback(),
//       home: _MyCanvas(),
//     );
//   }
// }

// class CustomCanvasPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint();
//     paint.color = Colors.amber;
//     canvas.drawCircle(Offset(100.0 ,200.0), 40.0, paint);

//     Paint paintRect = Paint();
//     paintRect.color = Colors.lightBlue;
//     Rect rect = Rect.fromPoints(Offset(150.0, 300.0), Offset(300.0, 400.0));
//     canvas.drawRect(rect, paintRect);
//   }

//   bool shouldRepaint(CustomCanvasPainter oldDelegate) => false;
//   bool shouldRebuildSemantics(CustomCanvasPainter oldDelegate) => false;
// }

// class _MyCanvas extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomPaint(
//           painter: CustomCanvasPainter(),
//       ),
//     );
//   }
// }


// // class _MyCanvas extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: CustomPaint(
// //         painter: CustomCanvasPainter(),
// //       ),
// //     );
// //   }
// // }

// //  前面的渲染例子 , 自定义画布的实现方式
// class DemoApp extends StatelessWidget {
//     Widget build(BuildContext context) => Scaffold(body: Signature());
// }

// class Signature extends StatefulWidget {
//   // SignatureState({Key key}) : super(key: key);
//   SignatureState createState() => SignatureState();
// }

// class SignatureState extends State<Signature> {
//   List<Offset> _points = <Offset>[];
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onPanUpdate: (DragUpdateDetails details) {
//         setState(() {
//           RenderBox referenceBox = context.findRenderObject();
//           Offset localPosition =
//           referenceBox.globalToLocal(details.globalPosition);
//           _points = List.from(_points)..add(localPosition);
//         });
//       },
//       onPanEnd: (DragEndDetails details) => _points.add(null),
//       child: CustomPaint(painter: SignaturePainter(_points), size: Size.infinite),
//     );
//   }
// }

// class SignaturePainter extends CustomPainter {
//   SignaturePainter(this.points);
//   final List<Offset> points;
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..color = Colors.black
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 5.0;
//     for (int i = 0; i < points.length - 1; i++) {
//       if (points[i] != null && points[i + 1] != null)
//         canvas.drawLine(points[i], points[i + 1], paint);
//     }
//   }
//   bool shouldRepaint(SignaturePainter other) => other.points != points;
// }

// // 这个是关于点击，有动画效果的内容， 将animation添加到controller里面去； 
// class FadeTest extends StatelessWidget {
//     @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       title: '动画',
//       theme: ThemeData(
//           primarySwatch: Colors.lightBlue,
//       ),
//         home : MyFadeTest(title: 'fade test'),
//     );
//   }
// }

// class MyFadeTest extends StatefulWidget {
//   MyFadeTest({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   _MyFadeTest createState() => _MyFadeTest();
// }

// class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
//   AnimationController controller;
//   CurvedAnimation curve;

//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
//     curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Container(
//           child: FadeTransition(
//             opacity: curve,
//             child: FlutterLogo(size: 100)
//           )
//         )
//       ),
//       floatingActionButton: FloatingActionButton(
//         tooltip: 'Fade',
//         child: Icon(Icons.brush),
//         onPressed: (){
//           controller.forward();
//         },
//       ),
//     );
//   }
// }


// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }


// //  基本上的首页
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // Default placeholder text
//   bool toggle = true;
//   void _toggle() {
//     setState(() {
//       toggle = !toggle;
//       Navigator.of(context).pushNamed('/d');  // 主要用于上面的跳转
//       // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> UsualNavscreen()));
//     });
//   }

//   _getToggleChild() {
//     if (toggle) {
//       return Text("toggle one: ${toggle}");
//     }
//     else {
//       return MaterialButton(
//         onPressed: () {},
//         child: Text('Toggle two: ${toggle}')
//       );
//     }
//   }

//   _getUpdateText() {
//     return  _getToggleChild();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sample1 App"),
//       ),
//       body: Center(
//         child: _getUpdateText(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _toggle,
//         tooltip: 'update text',
//         child: Icon(Icons.update),
//       ),
//     );
//   }
// }
