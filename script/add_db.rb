require 'rubygems'
require 'sqlite3'

db = SQLite3::Database.new("test.db")
sql = <<SQL
CREATE TABLE Posts (
id integer PRIMARY KEY AUTOINCREMENT,
filename String,
layout String,
title String,
tags String,
old_url String,
category String,
description String,
modified String,
image String,
date String,
comments String,
categories String,
tagline String,
summary String,
tag String,
published String,
draft String);
SQL
db.execute(sql)
db.close
