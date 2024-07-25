// import 'package:clothes_store_mobile_app/app/cubits/my_card/check_out_state.dart';
// import 'package:clothes_store_mobile_app/app/models/product_cart.dart';
// import 'package:clothes_store_mobile_app/app/views/check_out/components/product_order.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../constants/color_constants.dart';
// import '../../../constants/text_style.dart';
// import '../../../l10n/l10n.dart';
//
// class OrderListWidget extends StatefulWidget {
//   const OrderListWidget({super.key, required this.state});
//   final MyCardState state;
//
//   @override
//   State<OrderListWidget> createState() => _OrderListWidgetState();
// }
// class _OrderListWidgetState extends State<OrderListWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Text(
//           S.of(context).orderList,
//           style: TextStyleConstant.lightLight26.copyWith(
//             color: ColorConstants.neutralLight120,
//             height: 0.9,
//           ),
//         ),
//         Column( // Replace Column with ListView
//           children: widget.state.cart.listProducts!.map(
//                 (product) {
//               return ProductOrder(product: product);
//             },
//           ).toList(),
//         ),
//       ],
//     );
//   }
// }
// // class _OrderListWidgetState extends State<OrderListWidget> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Expanded(
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.stretch,
// //         children: [
// //           Text(
// //             S.of(context).orderList,
// //             style: TextStyleConstant.lightLight26.copyWith(
// //               color: ColorConstants.neutralLight120,
// //               height: 0.9,
// //             ),
// //           ),
// //           Column(
// //             children: widget.state.cart.listProducts!.map(
// //               (product) {
// //                 return ProductOrder(product: product);
// //               },
// //             ).toList(),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// // }
