import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

///* `id` - 
///* `title` -
///* `value` -
@freezed
class TransactionModel with _$TransactionModel{
  const factory TransactionModel({
    int? id,
    required String title,
    required double value,
    required DateTime date,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, Object?> json) => _$TransactionModelFromJson(json);
}
