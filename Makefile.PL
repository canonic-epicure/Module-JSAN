use inc::Module::Install;

name     'Module-JSAN';

all_from 'lib/Module/JSAN.pm';
author   'Nickolay Platonov <nplatonov@cpan.org>';
license  'perl';


requires            'parent' => '0.218';
requires            'Module::Build::JSAN::Installable' => '0.05';

requires            'File::Slurp';
requires            'Module::Build' => 0.35;

test_requires       'Test::More';
test_requires       'Test::Compile';
test_requires       'Capture::Tiny' => 0.06;


WriteAll;

