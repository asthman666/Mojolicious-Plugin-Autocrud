Mojolicious-Plugin-Autocrud
===========================

1) mojo generate app

2) cd my_app

3) vi lib/MyApp.pm

4) add code 

`use lib 'the plugin lib'`

`$self->plugin('Autocrud', db_name => 'db_name', db_user => 'db_user', db_password => 'db_password');` 

IF you want to control display field in read page, need to add conf:
    display => {
        $table => {
            db_list_display_fields => ['field1', 'field2', 'field3'],
        },
    }    

5) morbo script/my_app

6) visit http://localhost:3000/admin/$table
