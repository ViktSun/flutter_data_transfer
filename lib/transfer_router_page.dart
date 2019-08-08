import 'package:flutter/material.dart';
import 'package:flutter_data_transfer/transfer_data_entity.dart';

class TransferRouterPage extends StatelessWidget {
  final TransferDataEntity data;

  TransferRouterPage({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("返回上个页面传递参数"),
        leading: Builder(builder: (BuildContext context){
          return IconButton(icon: const Icon(Icons.arrow_back_ios),
          onPressed:(){
            _backToData(context);
          } );
        }),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 40.0,
            child: Text(data.name),
          ),
          Container(
            alignment: Alignment.center,
            height: 40.0,
            child: Text(data.id),
          ),
          Container(
            alignment: Alignment.center,
            height: 40.0,
            child: Text("${data.age}"),
          ),
          FlatButton(onPressed: (){
            _backToData(context);
          }, child: Text("点我返回上一个页面并把数据传回去"))
        ],
      ),
    );
  }

  //返回并携带数据
  _backToData(BuildContext context){
    var transferData = TransferDataEntity("嘻嘻哈哈","007",20);
    Navigator.pop(context,transferData);
  }
}
