import 'package:clothes_store_mobile_app/app/cubits/check_out/check_out_cubit.dart';
import 'package:clothes_store_mobile_app/app/cubits/check_out/check_out_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/text_style.dart';
import '../../../l10n/l10n.dart';

class DetailPaymentWidget extends StatefulWidget {
  const DetailPaymentWidget({super.key, required this.state});

  final CheckOutState state;

  @override
  State<DetailPaymentWidget> createState() => _DetailPaymentWidgetState();
}

class _DetailPaymentWidgetState extends State<DetailPaymentWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckOutCubit, CheckOutState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.of(context).detailPayment,
              style: TextStyleConstant.regularLight28.copyWith(
                color: ColorConstants.neutralLight120,
              ),
            ),
            if (widget.state.voucherApplied.id.isNotEmpty &&
                widget.state.voucherApplied.code.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).subTotal,
                        style: TextStyleConstant.lightLight24.copyWith(
                          color: ColorConstants.neutralLight120,
                        ),
                      ),
                      Text(
                        "\$${(widget.state.total).toString()}",
                        style: TextStyleConstant.lightLight24.copyWith(
                          color: ColorConstants.neutralLight120,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).deliveryFee,
                        style: TextStyleConstant.lightLight24.copyWith(
                          color: ColorConstants.neutralLight120,
                        ),
                      ),
                      Text(
                        "\$${(widget.state.shipping.cost).toString()}",
                        style: TextStyleConstant.lightLight24.copyWith(
                          color: ColorConstants.neutralLight120,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).discount,
                        style: TextStyleConstant.lightLight24.copyWith(
                          color: ColorConstants.neutralLight120,
                        ),
                      ),
                      Text(
                        "- \$${(widget.state.voucherApplied.discount).toString()}",
                        style: TextStyleConstant.lightLight24.copyWith(
                          color: ColorConstants.neutralLight120,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).subTotal,
                        style: TextStyleConstant.lightLight24.copyWith(
                          color: ColorConstants.neutralLight120,
                        ),
                      ),
                      Text(
                        "\$${(widget.state.total).toString()}",
                        style: TextStyleConstant.lightLight24.copyWith(
                          color: ColorConstants.neutralLight120,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).deliveryFee,
                        style: TextStyleConstant.lightLight24.copyWith(
                          color: ColorConstants.neutralLight120,
                        ),
                      ),
                      Text(
                        "\$${(widget.state.shipping.cost).toString()}",
                        style: TextStyleConstant.lightLight24.copyWith(
                          color: ColorConstants.neutralLight120,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  S.of(context).totalPrice,
                  style: TextStyleConstant.lightLight24.copyWith(
                    color: ColorConstants.neutralLight120,
                  ),
                ),
                Text(
                  "\$${(widget.state.total + widget.state.shipping.cost - widget.state.voucherApplied.discount).toStringAsFixed(2)}",
                  style: TextStyleConstant.lightLight24.copyWith(
                    color: ColorConstants.neutralLight120,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
