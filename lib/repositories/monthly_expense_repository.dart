import 'package:finance_app/database/database_helper.dart';
import 'package:finance_app/models/monthly_expense_model.dart';
import 'package:finance_app/database/table_names.dart';
import 'package:sqflite/sqflite.dart';

class MonthlyExpenseRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  //method to insert a new monthly expense into the database
  Future<int> insertExpense(MonthlyExpense expense) async {
    final db = await _dbHelper.database;
    return await db.insert(
        TableNames.monthlyExpenses,
        expense.toMap());
  }

  //method to retrieve all monthly expenses from the database
  Future<List<MonthlyExpense>> getAllExpenses() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(TableNames.monthlyExpenses);
    return List.generate(maps.length, (i) {
      return MonthlyExpense.fromMap(maps[i]);
    });
  }

  //method to retrieve a single monthly expense by its id from the database
  Future<MonthlyExpense?> getExpenseById(int id) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      TableNames.monthlyExpenses,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return MonthlyExpense.fromMap(maps.first);
    } else {
      return null; //return null if no expense is found with the given id
    }
  }

  //method to update an existing monthly expense in the database
  Future<int> updateExpense(MonthlyExpense expense) async {
    if (expense.id == null) {
      throw ArgumentError('Cannot update MonthlyExpense without an id.');
    }

    final db = await _dbHelper.database;
    return await db.update(
      TableNames.monthlyExpenses,
      expense.toMap(),
      where: 'id = ?',
      whereArgs: [expense.id],
    );
  }

  //method to delete a monthly expense from the database by its id
  Future<int> deleteExpenseById(int id) async {
    final db = await _dbHelper.database;
    return await db.delete(
      TableNames.monthlyExpenses,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //method to delete monthly expense from the database as object
  Future<int> deleteExpense(MonthlyExpense expense) async {
    if (expense.id == null) {
      throw ArgumentError('Cannot delete MonthlyExpense without an id.');
    }
    return deleteExpenseById(expense.id!);
  }

  //method to delete all monthly expenses from the database
  Future<int> deleteAllExpenses() async {
    final db = await _dbHelper.database;
    return await db.delete(TableNames.monthlyExpenses);
  }

  //method to count the total number of monthly expenses in the database
  Future<int> countExpenses() async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery(
        'SELECT COUNT(*) as count FROM ${TableNames.monthlyExpenses}');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  //helper method to check if a monthly expense with a specific id exists in the database
  Future<bool> expenseExists(int id) async {
    final db = await _dbHelper.database;
    final result = await db.query(
      TableNames.monthlyExpenses,
      columns: ['id'],
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    return result.isNotEmpty;
  }

  //helper method to return all monthly expenses in a specific category
  Future<List<MonthlyExpense>> getExpensesByCategory(String category) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      TableNames.monthlyExpenses,
      where: 'category = ?',
      whereArgs: [category],
    );
    return List.generate(maps.length, (i) {
      return MonthlyExpense.fromMap(maps[i]);
    });
  }

  //helper method to calculate the total amount of all monthly expenses in the database
  Future<double> calculateTotalExpenses() async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery(
        'SELECT SUM(amount) as total FROM ${TableNames.monthlyExpenses}');
    return (result.first['total'] as num?)?.toDouble() ?? 0.0;
  }

  //helper method to calculate the total amount of monthly expenses in a specific category
  Future<double> calculateTotalExpensesByCategory(String category) async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery(
        'SELECT SUM(amount) as total FROM ${TableNames.monthlyExpenses} WHERE category = ?',
        [category]);
    return (result.first['total'] as num?)?.toDouble() ?? 0.0;
  }
}