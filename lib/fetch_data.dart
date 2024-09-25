import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_edit_controller/transaction_class.dart';

Future<List<Transaction>> fetchTransaction() async {
  final response = await get(Uri.parse(
      'https://infra.devskills.app/api/transaction-management/transactions'));
  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    // Map each item in the list to a Transaction object
    return jsonList.map((json) => Transaction.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load transaction');
  }
}

Future<List<Transaction>> createTransaction(Transaction transaction) async {
  final response = await post(
    Uri.parse(
        'https://infra.devskills.app/api/transaction-management/transactions'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(transaction.toJson()),
  );

  if (response.statusCode == 201) {
    return fetchTransaction();
  } else {
    throw Exception('Failed to create transaction');
  }
}
