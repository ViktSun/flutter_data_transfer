import 'dart:async';

import 'package:flutter_data_transfer/transfer_data_entity.dart';

class TransferStreamSingleton {
  static final TransferStreamSingleton _instanceTransfer =
      TransferStreamSingleton.__internal();
  StreamController streamController;

  void setTransferData(TransferDataEntity transData) {
    streamController = StreamController<TransferDataEntity>();
    streamController.sink.add(transData);
  }

  factory TransferStreamSingleton() {
    return _instanceTransfer;
  }

  TransferStreamSingleton.__internal();
}

final streamSingletonData = TransferStreamSingleton();
