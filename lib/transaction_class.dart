class Transaction {
  String transactionId;
  String accountId;
  String amount;
  String createdAt;

  Transaction(
      {required this.accountId,
      required this.createdAt,
      required this.amount,
      required this.transactionId});

  Transaction.fromJson(Map<String, dynamic> json)
      : accountId = json['account_id'] ?? '',
        createdAt = json['created_at'] ?? '',
        transactionId = json['transaction_id'] ?? '',
        amount = json['amount']?.toString() ?? '0';

  Map<String, dynamic> toJson() => {
        'account_id': accountId,
        'created_at': createdAt,
        'amount': amount,
        'transaction_id': transactionId,
      };
}
