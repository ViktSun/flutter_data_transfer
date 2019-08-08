import 'package:flutter/material.dart';
import 'package:flutter_data_transfer/transfer_data_singleton.dart';

class TransferSingletonPage extends StatefulWidget {
  @override
  _TransferSingletonPageState createState() => _TransferSingletonPageState();
}

class _TransferSingletonPageState extends State<TransferSingletonPage> {
  @override
  Widget build(BuildContext context) {
    var data = transSingletonData.transData;
    return Scaffold(
      appBar: AppBar(
        title: Text("全局单例传递数据"),
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
        ],
      ),
    );
  }
}
