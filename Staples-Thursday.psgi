use lib 'lib';
use Staples::Thursday;
use Plack::Builder;
use Plack::App::File;

my $handler = sub { Staples::Thursday->run_psgi(@_) };
my $root = Plack::App::File->new({ file => './root/index.html' })->to_app;

builder {
    mount '/thursday' => $handler,
    mount '/' => $root,
}
