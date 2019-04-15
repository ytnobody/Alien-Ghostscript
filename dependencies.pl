sub deps {
    {
        common => {
            'ExtUtils::MakeMaker'                     => 6.52,
            'Alien::Build'                            => 1.41,
            'Alien::Build::MM'                        => 1.41,
            'Alien::Build::Plugin::Cleanse::BuildDir' => 0,
            'PkgConfig'                               => 0,
            'Sort::Versions'                          => 0,
            ($^O =~ /mswin/i) ? ('Alien::MSYS' => 0) : (),
        },
        test => {
            'Test::Alien'   => 0,
            'FFI::CheckLib' => 0.23,
        },
        prereq => {
            'Alien::Base'   => 1.41,
            'FFI::CheckLib' => 0.23,
        },

    };
}

1;