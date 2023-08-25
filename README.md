# SalesSystem

Sales System is a Client server in Ruby to access postgres database.

In this system there are 4 actions (List, search by key, add, change)
for four entities (products, sellers, clients, sales).

======================================================================

config server: 
    1) install this gem by running in terminal: gem install pg ;
    2) install postgres or docker with postgres image ;
    3) run the database scripts (script.sql) ;
    4) change the database access user and password properties in server/config/database.yml ;

config client: set server host and port in view.rb    

run tests of server: 
    rspec spec/models/*.*

======================================================================

start server: open terminal, move to folder server and execute rails server

start client: open another terminal, move to folder client and execute ruby home.rb

