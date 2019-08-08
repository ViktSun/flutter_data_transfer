import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_data_transfer/transfer_data_entity.dart';

///通过构造器的方式传递参数
class DataTransferByConstructorPage extends StatelessWidget {
  final TransferDataEntity data;

  DataTransferByConstructorPage({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("构造器方式"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 40.0,
            alignment: Alignment.center,
            child: Text(data.id),
          ),
          Container(
            width: double.infinity,
            height: 40.0,
            alignment: Alignment.center,
            child: Text(data.name),
          ),
          Container(
            width: double.infinity,
            height: 40.0,
            alignment: Alignment.center,
            child: Text("${data.age}"),
          )
        ],
      ),
    );
  }
}
