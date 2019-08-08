import 'package:flutter/material.dart';
import 'package:flutter_data_transfer/transfer_constructor_page.dart';
import 'package:flutter_data_transfer/transfer_data_entity.dart';
import 'package:flutter_data_transfer/transfer_data_inherited.dart';
import 'package:flutter_data_transfer/transfer_data_singleton.dart';
import 'package:flutter_data_transfer/transfer_generic_inherited.dart';
import 'package:flutter_data_transfer/transfer_generic_provider.dart';
import 'package:flutter_data_transfer/transfer_router_page.dart';
import 'package:flutter_data_transfer/transfer_singleton_page.dart';
import 'package:flutter_data_transfer/transfer_stream_singleton.dart';
import 'package:flutter_data_transfer/transfer_stream_singleton_page.dart';

import 'inherited_data_provider.dart';
import 'inherited_params_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  var params = TransferDataEntity("王五", "009", 16);

  @override
  Widget build(BuildContext context) {
    return IGenericDataProvider<TransferDataEntity>(
      data: params,
      child: MaterialApp(
        title: 'Data Transfer Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Data Transfer Demo'),
      ),
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
  final data = TransferDataEntity("001", "张三丰", 18);

  List<String> itemNames = [
    "构造器传递数据",
    "返回上个页面时携带参数",
    "InheritedWidget方式",
    "InheritedWidget泛型方式",
    "全局对象的方式",
    "Singleton方式",
    "Singleton结合Stream",
    "回调方式"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              height: 60.0,
              color: Colors.black12,
              child: Text("${data.id},${data.name},${data.age}")),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext contex, int index) {
                return Divider(
                  color: Colors.black12,
                  height: 0.5,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => _onClick(index, data, context),
                  child: Container(
                    alignment: Alignment.center,
                    height: 48.0,
                    width: double.infinity,
                    child: Text(
                      itemNames[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                );
              },
              itemCount: itemNames.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _onClick(int index, TransferDataEntity data, BuildContext context) {
    switch (index) {
      case 0:
        _transferDataByConstructor(context, data);
        break;
      case 1:
        _toTransferForResult(context, data);
        break;

      case 2:
        _inheritedToPage(context, data);
        break;
      case 3:
        _inheritedGenericToPage(context, data);
        break;

      case 4:
        _transferDataByGlobal(context);
        break;

      case 5:
        _singletonDataTransfer(context);
        break;
      case 6:
        _streamDataTransfer(context);
        break;

    }
  }

  //通过构造器方法传递数据
  _transferDataByConstructor(BuildContext context, TransferDataEntity data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DataTransferByConstructorPage(data: data)));
  }

  _toTransferForResult(BuildContext context, TransferDataEntity data) async {
    final dataFromOtherPage = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TransferRouterPage(data: data)),
    ) as TransferDataEntity;
    data.name = dataFromOtherPage.name;
    data.id = dataFromOtherPage.id;
    data.age = dataFromOtherPage.age;
  }

  _inheritedToPage(BuildContext context, TransferDataEntity data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => IDataProvider(
                  child: IDataWidget(),
                  data: data,
                )));
  }

  //泛型使用Inherited方式传递数据
  _inheritedGenericToPage(BuildContext context, TransferDataEntity data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => IGenericDataProvider<TransferDataEntity>(
                  child: IGenericDataWidget(),
                  data: data,
                )));
  }

  _transferDataByGlobal(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => InheritedParamsPage()));
  }

  _singletonDataTransfer(BuildContext context) {
    var transferData = TransferDataEntity("二汪", "002", 25);
    transSingletonData.transData = transferData;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TransferSingletonPage()));
  }


  _streamDataTransfer(BuildContext context) {
    var transferData = TransferDataEntity("三喵", "005", 20);
    streamSingletonData.setTransferData(transferData);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TransferStreamPage()));
  }
}
