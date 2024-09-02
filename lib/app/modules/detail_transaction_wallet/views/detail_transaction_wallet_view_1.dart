import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_transaction_wallet_controller.dart';

class DetailTransactionWalletView
    extends GetView<DetailTransactionWalletController> {
  const DetailTransactionWalletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailTransactionWalletView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailTransactionWalletView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
