class MonthlyExpense{
  final int? id;
  final String expenseName;
  final String expenseAmount;

  MonthlyExpense({
    this.id,
    required this.expenseName,
    required this.expenseAmount
  });

  Map <String, dynamic> toMap() {
    return{
      'id' : id,
      'expense_name' : expenseName,
      'expense_amount' : expenseAmount,
    };
  }
}