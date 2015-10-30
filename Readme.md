Simple example of intergation with MegaFon VCC (virtual call center) API

http://vcc.megafonkavkaz.ru/

Deployed at http://callsmonitor.fablab61.ru

Backend: [Mojolicious](http://mojolicio.us/)

Frontend: (AngularJS](https://angularjs.org/) + [Smart Table](https://github.com/lorenzofox3/Smart-Tables)

# How to run at developer machine

```
sudo cpan mojolicious
morbo myapp.pl
```

# How to run at production machine

```
sudo cpan mojolicious
hypnotoad myapp.pl
```

Before it add your VCC details and change running port if necessary at myapp.conf

```
{
  vcc => {
  login => '7928XXXXXXX',
  password => 'XXXXXX',
  },
  hypnotoad => {
    listen  => ['http://*:8090'],
  },
};
```


To check which ports are already busy:

```
netstat -ntulp | grep LISTEN
```

[Nginx configuration example you can find here](http://mojolicio.us/perldoc/Mojolicious/Guides/Cookbook#Nginx).

[Other Mojolicious examples you can find here](https://github.com/kraih/mojo/wiki/Example-applications).