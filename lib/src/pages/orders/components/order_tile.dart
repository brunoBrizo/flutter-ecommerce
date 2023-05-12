import 'package:flutter/material.dart';
import 'package:quitanda_app/src/models/cart_item_model.dart';
import 'package:quitanda_app/src/models/order_model.dart';
import 'package:quitanda_app/src/pages/common_widgets/payment_pix_dialog.dart';
import 'package:quitanda_app/src/pages/orders/components/order_status_widget.dart';
import 'package:quitanda_app/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  final UtilsServices utils = UtilsServices();

  OrderTile({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order: ${order.id}'),
              Text(
                utils.formatDateTime(order.createdAt),
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  // Products list
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150.0,
                      child: ListView(
                        children: order.items.map((item) {
                          return _OrderItemWidget(
                            utils: utils,
                            item: item,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  // Divider
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 9.0,
                  ),
                  // Order status
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue: order.overdueAt.isBefore(
                        DateTime.now(),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // Total
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 20.0,
                ),
                children: [
                  const TextSpan(
                    text: 'Total ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: utils.priceToCurrency(order.total),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // Payment button
            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                )),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return PaymentPixDialog(
                          order: order,
                        );
                      });
                },
                icon: Image.asset(
                  'assets/app_images/pix.png',
                  height: 18.0,
                ),
                label: const Text(
                  'View Pix QR Code',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  final CartItemModel item;

  const _OrderItemWidget({
    required this.utils,
    required this.item,
  });

  final UtilsServices utils;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Row(
        children: [
          Text(
            '${item.quantity} ${item.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              item.item.name,
            ),
          ),
          Text(
            utils.priceToCurrency(
              item.totalPrice(),
            ),
          ),
        ],
      ),
    );
  }
}
