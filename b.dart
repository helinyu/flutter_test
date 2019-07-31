void main() {

  // Future<String>  waitDinnerFuture=new Future(waitForDinner);
  // waitDinnerFuture.then((str){
  //   print('str : ${str}');
  // });//接收上层返回可用的值
  // waitDinnerFuture.whenComplete((){
  //   print("complete");
  // });//事件完成回调
  // waitDinnerFuture.catchError((error){
  //   print("error : ${error}");
  // });//事件错误的捕获
  // waitDinnerFuture.timeout(new Duration(microseconds: 30));//超时时间


  print(  enterRestaurant());
  Future<String>  waitDinnerFuture=new Future(waitForDinner);
  waitDinnerFuture.then((str){
    print(str);
  });
  print(  startChat());
  print(  playPhone());
}

// 我们先借助于Future APi来实现异步效果。
// 首先我们需要自己声明一个属于我们的Future对象。

String enterRestaurant(){
  return "和朋友进入了一家餐馆";
}
String waitForDinner(){
  return "我们的菜来了，我要开始吃饭了";
}
String startChat(){
  return "我们朋友聊起家常";
}
String playPhone(){

  return "等了好好久了，我还是玩会手机吧";
}
