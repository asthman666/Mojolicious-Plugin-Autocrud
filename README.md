Mojolicious-Plugin-Autocrud
===========================

1) mojo generate app

2) cd my_app

3) vi lib/MyApp.pm

4) add code 

`$self->plugin('Autocrud', db_name => 'db_name', db_user => 'db_user', db_password => 'db_password');` 

5) morbo script/my_app

6) visit http://localhost:3000/admin/$table_name
