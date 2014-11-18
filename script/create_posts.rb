require 'rubygems'
require 'sqlite3'

db = SQLite3::Database.new("/Users/meganii/Work/Site/JekyllFFViewer/db/development.sqlite3")
sql = <<SQL
CREATE TABLE Posts  (
id integer PRIMARY KEY AUTOINCREMENT,
filename String,
content Text,
metadata Text);
SQL
db.execute(sql)
db.close
