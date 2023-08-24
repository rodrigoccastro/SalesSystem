# SalesSystem

Sales System is a Client server in Ruby to access postgres database.

In this system there are 4 actions (List, search by key, add, change)
for four entities (products, sellers, clients, sales).

======================================================================

config server 
    1) install this gem by running in terminal: gem install pg
    2) install postgres or docker with postgres image
    3) run the database scripts (script.sql)
    4) change the database access user and password properties in server/config/database.yml

start server
    run in terminal: 
        cd server
        rails server

start client
    open terminal and run: 
        cd client
        ruby home.rb
