import 'package:expenses_manager_app/src/blocs/transaction_state.dart';
import 'package:expenses_manager_app/src/core/fonts.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomListLoader extends StatelessWidget {
  final TransactionState state;
  final bool isEmptyList;
  final Widget Function() buildLoadedList;
  final Widget Function() buildLoadingList;
  
  const CustomListLoader({super.key,required this.state, required this.isEmptyList, required this.buildLoadedList, required this.buildLoadingList});

  @override
  Widget build(BuildContext context) {
    if (isEmptyList) {
      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/empty_list.json'),
            const SizedBox(height: 15),
            Text('Não há despesas cadastradas', style: notFoundStyle,),
          ],
        ),
      );
    } else if (state is LoadingTransactionState) {
      return buildLoadingList();
    }
    return buildLoadedList();
  }
}