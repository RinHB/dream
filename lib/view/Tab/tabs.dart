
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  void initState(){
    super.initState();
    _bottomName.forEach((key, value) {
    bottomNavBarList.add(bottomNavigationBarItem(key,value));
    });
  }

  //页面集合
  final Map _bottomName = {
    "HomePage" : "首页",
    "CollectionPage" : "藏品",
    "PersonalHomePage" : "我的",
  };

  List<BottomNavigationBarItem> bottomNavBarList = [];
  //底部导航
  BottomNavigationBarItem bottomNavigationBarItem(String key,String value){
    return BottomNavigationBarItem(
        icon: Image.asset(      //图片
          'assets/images/tabs/$key.png',
          height: 25,
          width: 25,
        ),
        activeIcon: Image.asset(        //点击时的显示图片
          'assets/images/tabs/$key-checked.png',
          height: 25,
          width: 25,
        ),
        label: value
    );
  }

  int _currentIndex = 0;
  late final List<IndexedStackChild> _pageList = [
    IndexedStackChild(
        child: Container()
    ),
    IndexedStackChild(
        child: Container()
    ),
    IndexedStackChild(
        child: Container()
    )
  ];

  void _TabClick(index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);       //屏幕适配初始化
    return Scaffold(
      body: ProsteIndexedStack(       //懒加载的带index的Stack,只显示index对应的一个Stack
        index: _currentIndex,
        children: _pageList,
      ),
      bottomNavigationBar: Theme(       //主题
        data: ThemeData(
          brightness: Brightness.light,   //白天模式/黑夜模式
          splashColor: Colors.transparent,    //点击时的水波纹颜色
          highlightColor: Colors.grey    //选中时的颜色
        ),
        child: BottomNavigationBar(
          // selectedItemColor: Colors.white,
          items: bottomNavBarList,
          onTap: _TabClick,
      ),
      ),
    );
  }
}
