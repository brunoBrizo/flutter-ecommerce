import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quitanda_app/src/models/order_model.dart';
import 'package:quitanda_app/src/services/utils_services.dart';

class PaymentPixDialog extends StatelessWidget {
  final UtilsServices utils = UtilsServices();
  final OrderModel order;

  PaymentPixDialog({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Content
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Text(
                      'Pix Payment',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  // QR Code
                  QrImage(
                    data: "1234567890",
                    version: QrVersions.auto,
                    size: 200.0,
                  ),

                  // Expire date
                  Text(
                    'Expire date: ${utils.formatDateTime(order.overdueAt)}',
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),

                  // Total
                  Text(
                    'Total: ${utils.priceToCurrency(order.total)}',
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Copy Paste button
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          width: 2.0,
                          color: Colors.green,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                        )),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.copy,
                      size: 15.0,
                    ),
                    label: const Text(
                      'Copy Pix code',
                      style: TextStyle(
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Close button
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                ),
              ),
            ),
          ],
        ));
  }
}
