use strict;
use warnings;
use ExtUtils::MakeMaker;

my $depsfile = $^O =~ /mswin/i ? '.\dependencies.pl' : './dependencies.pl';
require $depsfile;
my $deps = deps();

my %WriteMakefileArgs = (
    'NAME'         => 'Alien::Ghostscript',
    'ABSTRACT'     => 'Alien package for the Ghostscript library',
    'AUTHOR'       => 'Satoshi AZUMA <ytnobody@gmail.com>',
    'VERSION_FROM' => "lib/Alien/Ghostscript.pm",
    'CONFIGURE_REQUIRES' => $deps->{common},
    'TEST_REQUIRES' => $deps->{test},
    'PREREQ_PM' => $deps->{prereq},
    'META_MERGE' => {
        'meta-spec' => {
            'version' => 2
        },
        'resources' => {
            'repository' => {
                'type' => 'git',
                'url'  => 'https://github.com/ytnobody/Alien-Ghostscript',
            },
            'bugtracker' => {
                'web'  => 'https://github.com/ytnobody/Alien-Ghostscript/issues/'
            }
        }
    },
    'DISTNAME' => 'Alien-Ghostscript',
    'LICENSE'  => 'perl',
);

use Alien::Build::MM;
my $alien = Alien::Build::MM->new();
%WriteMakefileArgs = $alien->mm_args(%WriteMakefileArgs);
WriteMakefile(%WriteMakefileArgs);

sub MY::postample {
    $alien->mm_postamble;
}