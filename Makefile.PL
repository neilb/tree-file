use strict;
use warnings;
use ExtUtils::MakeMaker;

die "Win32 is currently not supported due to timeouts in t/collapse.t\n"
  if $^O eq 'MSWin32';

my $mm_ver = $ExtUtils::MakeMaker::VERSION;
if ($mm_ver =~ /_/) { # developer release
    $mm_ver = eval $mm_ver;
    die $@ if $@;
}

WriteMakefile(
    NAME                => 'Tree::File',
    AUTHOR              => 'Ricardo Signes <rjbs@cpan.org>',
    VERSION_FROM        => 'lib/Tree/File.pm',
    ABSTRACT_FROM       => 'lib/Tree/File.pm',
    LICENSE             => 'perl',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'YAML'       => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Tree-File-* cover_db errors.err' },

    ($mm_ver <= 6.45
        ? ()
        : (META_MERGE => {
            x_deprecated => 1,
            'meta-spec' => { version => 2 },
            resources => {
                repository  => {
                    type => 'git',
                    web  => 'https://github.com/rjbs/tree-file',
                    url  => 'https://github.com/rjbs/tree-file.git',
                },
            },
          })
    ),

);
