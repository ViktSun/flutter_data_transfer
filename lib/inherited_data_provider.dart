

import 'package:flutter/material.dart';
import 'package:flutter_data_transfer/transfer_data_entity.dart';

class IDataProvider extends InheritedWidget{

  final TransferDataEntity data;

  IDataProvider({Widget child,this.data}):super(child:child);


  @override
  bool updateShouldNotify(IDataProvider oldWidget) {
    return data!=oldWidget.data;
  }

  static IDataProvider of(BuildContext context){
    return context.inheritFromWidgetOfExactType(IDataProvider);
  }
}