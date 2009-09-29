use inc::Module::Install;

name     'Module-JSAN';

all_from 'lib/Module/JSAN.pm';
author   'Nickolay Platonov <nplatonov@cpan.org>';
license  'perl';


requires            'Module::Build::JSAN::Installable' => 0.05;
requires            'Module::Build::Functions' => 0.01;

test_requires       'Test::More';
test_requires       'File::Path';
test_requires       'Test::Compile';
test_requires       'Capture::Tiny' => 0.06;


WriteAll;

