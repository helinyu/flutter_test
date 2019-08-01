import 'package:flutter/material.dart';
import 'model.dart';
import 'view_model.dart';
import 'package:flutter_image/network.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '知乎日报',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: MyHomePage(title: '知乎日报'), // 在原理的widget上构建home 的widget 
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StoryListViewModel storyListViewModel = StoryListViewModel(); // 创建一个vm对象

//  实话的默认方法
  @override
  void initState() {
    super.initState();
  }

//  析构方法
  @override
  void dispose() {
    super.dispose();
    storyListViewModel.dispose();
  }

//  构建widget
  @override
  Widget build(BuildContext context) {
    return Scaffold( // 脚手架，注意我们一般都是使用这个来实现就行了
        appBar: AppBar( // 导航狼
          title: Text(widget.title),
          leading: new Icon(Icons.arrow_back_ios),
          automaticallyImplyLeading: true,
          elevation: 10.0,
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: StreamBuilder<List<StoryModel>>( // 主题部分， 这里面半丁了stream 
            stream: storyListViewModel.outStoryList, // model 数据
            builder: (context, snapshot) {
              List stories = snapshot.data;
              return RefreshIndicator( // 刷新控件， 这个需要例子去实现一下
                onRefresh: () {
                  return storyListViewModel.refreshStoryList(); //刷新里面的方法 这个是刷新列表
                },
                child: ListView.builder( // 列表
                    itemCount: (stories?.length ?? 0) + 1,
                    itemBuilder: (context, index) {
                      if (index >= (stories?.length ?? 0)) {
                        storyListViewModel.loadNextPage(); // 设置文案，记载下一个页面
                        return _buildLoadMoreView();// 设置底部的文案
                      }
                      return _buildRow(stories[index]); // 返回的列表
                    }),
              );
            }));
  }


//  创建row的内容
//  这个就是一行一行的组件， 有点类似于我们的ios的cell， 每一行的内容
  Widget _buildRow(StoryModel story) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StoryContentPage(storyId: story.id))); // 通过meterial里面的路由进行跳转
      },
      child: Card( // 卡片
        child: Container(// 容器
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[// 一个数组， 从左边往右边
              Container( // 有点类似div
                width: 50,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // 垂直方向，其实就是纵向对齐
                  crossAxisAlignment: CrossAxisAlignment.start, // 水平方向对齐
                  children: <Widget>[
                    // Container(
                    //   height: 20.0,
                    // ),
                    Text(
                      story.title,
                      softWrap: true,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Center(
                child: Image(
                  image: NetworkImageWithRetry(story.images[0]),
                  height: 55,
                  width: 55,
                ),
              ),
              Container(
                width: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadMoreView() {
    return Center(child: Text("加载中..."));
  }
}

//  详情的storypage的详情页面 ， 详情里面的内容， 这个内容传入Id 然后
class StoryContentPage extends StatefulWidget {
  final int storyId;

  StoryContentPage({Key key, @required int storyId})
      : storyId = storyId,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _StoryContentPageState(storyId);
}

class _StoryContentPageState extends State<StoryContentPage> {
  final StoryContentViewModel storyContentViewModel;

  _StoryContentPageState(int storyId)
      : storyContentViewModel = StoryContentViewModel(storyId),
        super();

  @override
  void initState() {
    super.initState();
    storyContentViewModel.fetchStoryContent();
  }

  @override
  void dispose() {
    super.dispose();
    storyContentViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
            stream: storyContentViewModel.outStoryTitle,
            builder: (context, snapshot) {
              var title = snapshot.data;
              return Text(title == null ? "加载中..." : title);
            }),
      ),
      body: StreamBuilder(
          stream: storyContentViewModel.outStoryHtml,
          builder: (context, snapshot) {
            var html = snapshot.data;
            if (html != null) {
              return _buildStoryContent(context, html); // 加载html内容
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }));

  Widget _buildStoryContent(BuildContext context, String html) =>
      WebviewScaffold(
          withJavascript: true,
          withZoom: false,
          allowFileURLs: false,
          url: Uri.dataFromString(html,
              mimeType: 'text/html',
              parameters: {'charset': "utf-8"}).toString());
}
