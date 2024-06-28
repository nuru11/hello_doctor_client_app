import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/empty_list.dart';
import '../controllers/user_wallet_controller.dart';
import 'widgets/section_title.dart';
import 'widgets/transaction_tile.dart';

class UserWalletView extends GetView<UserWalletController> {
  const UserWalletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Wallet'.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: Get.width,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: GetBuilder<UserWalletController>(
                    builder: (_) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.userWallet?.currency ??
                                '\$' +
                                    (controller.userWallet?.balance ?? '0')
                                        .toString(),
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                controller.toTopUp();
                              },
                              child: Text('Top Up'.tr))
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SectionTitle(
              title: 'Last Transaction'.tr,
              subTitle: 'See all transaction'.tr,
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => controller.getTransaction(),
                child: controller.obx(
                    (listTransaction) => ListView.separated(
                          shrinkWrap: true,
                          itemCount: listTransaction!.length,
                          itemBuilder: (contex, index) {
                            switch (listTransaction[index].type!) {
                              case 'TopUp':
                                {
                                  return TransactionTile(
                                    type: 'TopUp',
                                    status: listTransaction[index].status!,
                                    amount: listTransaction[index]
                                        .transactionAmount!,
                                    dateCreate:
                                        listTransaction[index].createdAt!,
                                  );
                                }

                              case 'Payment':
                                {
                                  return TransactionTile(
                                    type: 'Purchase',
                                    status: listTransaction[index].status!,
                                    amount: listTransaction[index]
                                        .transactionAmount!,
                                    dateCreate:
                                        listTransaction[index].createdAt!,
                                    method: '',
                                    email: '',
                                  );
                                }
                            }
                            return null;
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 5,
                            );
                          },
                        ),
                    onEmpty: EmptyList(msg: 'No Transaction yet'.tr)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
