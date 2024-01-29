import 'package:expenses_manager_app/src/blocs/transaction_state.dart';
import 'package:expenses_manager_app/src/core/fonts.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomListLoader extends StatelessWidget {
  final TransactionState state;
  final bool isEmptyList;
  final Widget Function() buildLoadedList;
  final Widget Function() buildLoadingList;

  const CustomListLoader({
    super.key,
    required this.state,
    required this.isEmptyList,
    required this.buildLoadedList,
    required this.buildLoadingList,
  });

  @override
  Widget build(BuildContext context) {
    if (state is LoadingTransactionState) {
      return Card(
        elevation: 6,
        child: buildLoadingList(),
      );
    } else if (isEmptyList) {
      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/empty_list.json', repeat: false),
            const SizedBox(height: 15),
            Text(
              'Não há despesas cadastradas',
              style: notFoundStyle,
            ),
          ],
        ),
      );
    }
    return buildLoadedList();
  }
}
