void main() {
  Budget myBudget = Budget();

  myBudget.addTransaction(Transaction(1000, "Salary", "income"));
  myBudget.addTransaction(Transaction(200, " Work", "income"));
  myBudget.addTransaction(Transaction(300, "Rent", "expense"));
  myBudget.addTransaction(Transaction(1500, "gym", "expense"));

  print("Total Income: ${myBudget.totalIncome()}");
  print("Total Expenses: ${myBudget.totalExpenses()}");
  print("Balance: ${myBudget.balance()}");

  myBudget.displaySummary();
}

class Transaction {
  double amount;
  String description;
  String type;

  Transaction(this.amount, this.description, this.type);
}

class Budget {
  List<Transaction> income = [];
  List<Transaction> expenses = [];

  void addTransaction(Transaction transaction) {
    if (transaction.type == "income") {
      income.add(transaction);
    } else if (transaction.type == "expense") {
      expenses.add(transaction);
    } else {
      print("Invalid transaction type");
    }
  }

  double totalIncome() {
    double total = 0;
    for (var transaction in income) {
      total += transaction.amount;
    }
    return total;
  }

  double totalExpenses() {
    double total = 0;
    for (var transaction in expenses) {
      total += transaction.amount;
    }
    return total;
  }

  double balance() {
    return totalIncome() - totalExpenses();
  }

  void displaySummary() {
    print("\nIncome Transactions:");
    for (var transaction in income) {
      print("${transaction.description}: ${transaction.amount}");
    }

    print("\nExpense Transactions:");
    for (var transaction in expenses) {
      print("${transaction.description}: ${transaction.amount}");
    }
  }
}
