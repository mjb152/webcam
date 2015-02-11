#!/home/martin/perl5/perlbrew/perls/perl-5.20.1/bin/perl
use Mojolicious::Lite;

# Documentation browser under "/perldoc"
plugin 'PODRenderer';

get '/' => sub {
  my $c = shift;
  $c->render(template => 'index');
};

get '/camera' => sub {
  my $c = shift;
  $c->render(template => 'camera');
};

get '/camera/take' => sub {
  my $c = shift;
  my $cmd = '/usr/bin/raspistill -t 1 -o /home/martin/development/public/images/photo.jpg';
  open(FH, "$cmd |") or die "couldn't open camera";
  while(<FH>) {
	#
  }
  close(FH);
  $c->redirect_to('camera');
};

app->start;
