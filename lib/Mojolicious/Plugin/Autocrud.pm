package Mojolicious::Plugin::Autocrud;
use Mojo::Base 'Mojolicious::Plugin';
use Mojo::mysql;
use File::Basename 'dirname';
use File::Spec::Functions 'catdir';
 
sub register {
    my ($self, $app, $conf) = @_;
    
    $app->plugin('DefaultHelpers');
    $app->log(Mojo::Log->new);
    $app->config($conf->{display});

    $app->helper(
        mysql => sub { Mojo::mysql->new('mysql://' . $conf->{db_user} . ':' . $conf->{db_password} . '@' . ($conf->{db_host}||'localhost') . '/' . $conf->{db_name})->options({mysql_enable_utf8 => 1}) }
        );

    my $base = catdir(dirname(__FILE__), 'Autocrud');
    push @{$app->renderer->paths}, catdir($base, 'templates');
    push @{$app->static->paths},   catdir($base, 'public');

    my $r = $app->routes;

    $r->get('/admin/:table/read.json')->to('mojolicious-plugin-autocrud-admin#api_read', namespace => '');
    $r->post('/admin/:table/create.json')->to('mojolicious-plugin-autocrud-admin#api_create', namespace => '');
    $r->post('/admin/:table/update.json')->to('mojolicious-plugin-autocrud-admin#api_update', namespace => '');
    $r->post('/admin/:table/delete.json')->to('mojolicious-plugin-autocrud-admin#api_delete', namespace => '');
    $r->get('/admin/:table')->to('mojolicious-plugin-autocrud-admin#read', namespace => '');
}

1;
