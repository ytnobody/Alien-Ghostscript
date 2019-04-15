my $depsfile = $^O =~ /mswin/i ? '.\dependencies.pl' : './dependencies.pl';
require $depsfile;
my $deps = deps();

requires 'perl', '5.008001';

my $version;
for my $module (keys %{$deps->{common}}) {
    $version = $deps->{common}{$module};
    requires($module, $version);
}