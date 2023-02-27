import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dream/tool/ColorTable.dart';

class StarPage extends StatefulWidget {
  const StarPage({Key? key}) : super(key: key);

  @override
  State<StarPage> createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {
  int num = 10;
  Timer?_timer;

  @override
  void initState(){
    super.initState();
    _timer = Timer.periodic(
      const Duration(milliseconds: 1000),
        (timer){
          setState(() {
            --num;
          });
          if(num==0){
            _jumpRootPage();
          }
        }
    );
  }

  void _jumpRootPage(){
    _timer!.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(    //堆叠布局,后者居上,
        children: [
          Image.asset(
            'assets/images/log/startPage.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top+10,
            right: 10,
            child: InkWell(  //水波纹效果
              child: _chiButton(),
              ))
        ],
      ),
    );
  }

  Widget _chiButton(){
    return ClipRRect(   //圆形裁剪
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 50,
        color: ColorTable.tipColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "跳过",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12
              ),
            ),
            Text("${num}S",style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),)
          ],
        ),
      ),
    );
  }
}


