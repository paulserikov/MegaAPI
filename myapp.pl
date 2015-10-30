#!/usr/bin/env perl
use Mojolicious::Lite;

my $config = plugin 'Config';
my $api_url = 'https://vcc.megafonkavkaz.ru/vcc/rest/api';

get '/records' => sub {
  my $self = shift;
  my $resp = $self->ua->get($api_url .'/login' => form => {login => $config->{vcc}->{login}, password=>$config->{vcc}->{password}})->res->content->headers;
  my $cookie = $resp->{'headers'}->{'set-cookie'};
  $self->session('set-cookie' => $cookie);
  $resp = $self->ua->get($api_url .'/vcc/'.$config->{vcc}->{login}.'/record')->res->json;
  $self->render(json => $resp);
};

get '/' => sub {
  my $self = shift;
  $self->render(template => 'index');
};

app->start;
