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
      'expense_id' : id,
      'expense_name' : expenseName,
      'expense_amount' : expenseAmount,
    };
  }

  factory MonthlyExpense.fromMap(Map <String, dynamic> map){
    return MonthlyExpense(
      id: map['expense_id'],
      expenseName: map['expense_name'], 
      expenseAmount: map['expense_amount'],
    );
  }

  MonthlyExpense copyWith({
    int? id,
    String? expenseName,
    String? expenseAmount,
  }) {
    return MonthlyExpense(
      id: id ?? this.id ,
      expenseName: expenseName ?? this.expenseName, 
      expenseAmount: expenseAmount ?? this.expenseAmount
    );
  }
}