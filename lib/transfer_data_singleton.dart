import 'package:flutter_data_transfer/transfer_data_entity.dart';

class TransferDataSingleton {
  static final TransferDataSingleton _instanceTransfer =
      TransferDataSingleton.__internal();

  TransferDataEntity transData;

  factory TransferDataSingleton() {
    return _instanceTransfer;
  }

  TransferDataSingleton.__internal();
}

final transSingletonData = TransferDataSingleton();
