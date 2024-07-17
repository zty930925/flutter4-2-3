import 'package:flutter/material.dart';

//建立一個類別叫做ColorfulDemoScreen，並繼承StatefulWidget
class ColorfulDemoScreen extends StatefulWidget {
  @override
  //使用StatefulWidget，必須實作的createState方法，並回傳一個有繼承State的物件
  State createState() {
    return _ColorfulDemoScreenState();
  }
}

//建立State類別，提供StatefulWidget的狀態管理
class _ColorfulDemoScreenState extends State<ColorfulDemoScreen> {
  //用來判斷顏色是否為紅色的布林變數(bool)，預設為true（紅色）
  bool currentColorisRed = true;
  @override
  Widget build(BuildContext context) {
    //在build方法中輸出當前顏色狀態
    print('進入build函數，widget的currentColorisRed');
    //目前為預設(紅色)
    print(this.currentColorisRed);

    //建立一個widget叫做colorfulContainer
    Widget colorfulContainer;
    //根據currentColorisRed變數決定colorfulContainer容器的顏色
    //如果currentColorisRed為true，顏色設為紅色，並設定寬高
    if (this.currentColorisRed == true) {
      colorfulContainer = Container(
        color: Colors.red,
        width: 300,
        height: 300,
      );
    }
    //如果currentColorisRed為false，顏色設為藍色
    else {
      colorfulContainer = Container(
        color: Colors.blue,
        width: 300,
        height: 300,
      );
    }

    //Scaffold提供了一個應用的基本結構
    return Scaffold(
      //建立一個容器空間
      body: Container(
        //該容器與子元件皆位在畫面中上方
        alignment: Alignment.topCenter,
        //使用Column來排列子元件
        child: Column(
          children: [
            //在Column的children列表中加入colorfulContainer，以確保容器在畫面上顯示。
            colorfulContainer,
            //第一個容器
            Container(
              //放入文字按鈕
              child: TextButton(
                  //按鈕被按下時觸發的事件
                  onPressed: () {
                    setState(() {
                      //在按鈕點擊時輸出當前顏色狀態
                      print('用戶點擊過程中，widget的currentColorisRed');
                      print(this.currentColorisRed);
                      this.currentColorisRed = !this.currentColorisRed;

                      //切換顏色狀態，true變false，false變true
                      print('用戶點擊過程中，widget的currentColorisRed屬性，會重新賦值');
                      print(this.currentColorisRed);
                    });
                  },
                  //按鈕顯示的文字
                  child: Text('按我會變色')),
            )
          ],
        ),
      ),
    );
  }
}
