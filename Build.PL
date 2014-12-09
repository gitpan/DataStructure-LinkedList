use 5.006;
use strict;
use warnings FATAL => 'all';
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'DataStructure::LinkedList',
    license             => 'Artistic_2_0',
    dist_author         => q{shinchit <shinchi.xx@gmail.com>},
    dist_version_from   => 'lib/DataStructure/LinkedList.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build' => 0,
    },
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        'version' => 0,
        'Class::Accessor' => 0,
        'Scalar::Util' => 0,
        'Carp' => 0,
    },
    add_to_cleanup     => [ 'DataStructure-LinkedList-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
