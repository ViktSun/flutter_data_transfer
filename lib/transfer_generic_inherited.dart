import 'package:flutter/material.dart';
import 'package:flutter_data_transfer/transfer_data_entity.dart';
import 'package:flutter_data_transfer/transfer_generic_provider.dart';

class IGenericDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = IGenericDataProvider.of<TransferDataEntity>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Inherited泛型方式传递数据"),
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
          IGenericChildWidget()
        ],
      ),
    );
  }
}

class IGenericChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = IGenericDataProvider.of<TransferDataEntity>(context);
    return Container(
      child: Text(data.name),
    );
  }
}

