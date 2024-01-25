class DBUtils {
  static const String dbName = 'expense_manager.db';
  static const String tableTransaction = 'transaction';

  static const String createTableQuery = '''
    CREATE TABLE $tableTransaction (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title VARCHAR(100),
      value REAL,
      date DATETIME
    )
  ''';
}