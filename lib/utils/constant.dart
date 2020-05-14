const String HOST = "https://jsonplaceholder.typicode.com";
const String DB_NAME = "blog.db";
const String POST_TABLE_NAME = "Post";
const String COMMENT_TABLE_NAME = "Comment";

///почемуто скрипт создания сразу двух таблиц не пашет и создает только первую...
const String CREATE_POST_TABLES = """
  CREATE TABLE $POST_TABLE_NAME(
    userId INTEGER,
    id INTEGER PRIMARY KEY,
    title TEXT,
    body TEXT
  )""";
const String CREATE_COMMENT_TABLE = """
  CREATE TABLE $COMMENT_TABLE_NAME(
    postId INTEGER,
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    body TEXT,
    FOREIGN KEY(postId) REFERENCES $POST_TABLE_NAME(id)
  )""";