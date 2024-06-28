import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hallo_doctor_client/app/models/order_model.dart' as orderModel;
import 'package:hallo_doctor_client/app/models/time_slot_model.dart';
import 'package:hallo_doctor_client/app/service/user_service.dart';

class OrderService {
  Future<orderModel.Order> getSuccessOrder(TimeSlot timeSlot) async {
    try {
      var orderSnapshot = await FirebaseFirestore.instance
          .collection('Order')
          .where('timeSlotId', isEqualTo: timeSlot.timeSlotId)
          .where('status', isEqualTo: 'payment_success')
          .limit(1)
          .get();
      var data = orderSnapshot.docs.elementAt(0).data();
      data['orderId'] = orderSnapshot.docs.elementAt(0).reference.id;
      orderModel.Order order = orderModel.Order.fromMap(data);
      return order;
    } on FirebaseException catch (e) {
      return Future.error(e.message!);
    }
  }

  Future<orderModel.Order> getOrder(TimeSlot timeSlot) async {
    try {
      var orderData = await FirebaseFirestore.instance
          .collection('Order')
          .where('userId', isEqualTo: UserService().getUserId())
          .where('timeSlotId', isEqualTo: timeSlot.timeSlotId)
          .where('charged', isEqualTo: true)
          .get();
      var data = orderData.docs.elementAt(0).data();
      data['orderId'] = orderData.docs.elementAt(0).reference.id;
      orderModel.Order order = orderModel.Order.fromMap(data);
      return order;
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future confirmOrder(TimeSlot timeSlot) async {
    try {
      var order = await getOrder(timeSlot);
      return setOrderToComplete(order);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> setOrderToComplete(orderModel.Order order) async {
    await FirebaseFirestore.instance
        .collection("Order")
        .doc(order.orderId)
        .update({'status': 'success'});
  }
}
