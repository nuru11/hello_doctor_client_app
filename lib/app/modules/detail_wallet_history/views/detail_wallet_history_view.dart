import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_wallet_history_controller.dart';

class DetailWalletHistoryView extends GetView<DetailWalletHistoryController> {
  const DetailWalletHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailWalletHistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailWalletHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
