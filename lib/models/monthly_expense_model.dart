class MonthlyExpense{
  final int? id;
  final String expenseName;
  final String expenseAmount;
  final String expenseCategory;

  MonthlyExpense({
    this.id,
    required this.expenseName,
    required this.expenseAmount,
    required this.expenseCategory,
  });

  Map <String, dynamic> toMap() {
    return{
      'expense_id' : id,
      'expense_name' : expenseName,
      'expense_amount' : expenseAmount,
      'expense_category' : expenseCategory,
    };
  }

  factory MonthlyExpense.fromMap(Map <String, dynamic> map){
    return MonthlyExpense(
      id: map['expense_id'],
      expenseName: map['expense_name'], 
      expenseAmount: map['expense_amount'],
      expenseCategory: map['expense_category']
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
      expenseAmount: expenseAmount ?? this.expenseAmount,
      expenseCategory: expenseCategory
    );
  }
}