import 'package:flutter/material.dart';
import 'package:flutter_data_transfer/transfer_data_entity.dart';
import 'package:flutter_data_transfer/transfer_generic_provider.dart';


class InheritedParamsPage extends StatefulWidget {
  @override
  _InheritedParamsPageState createState() => _InheritedParamsPageState();
}

class _InheritedParamsPageState extends State<InheritedParamsPage> {
  @override
  Widget build(BuildContext context) {
    final data = IGenericDataProvider.of<TransferDataEntity>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("通过全局数据方式"),
      ),
      body:Column(
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
