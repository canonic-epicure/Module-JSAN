package Module::JSAN;

use warnings;
use strict;

our $VERSION = '0.01';


sub import {
    
    {
        package main;
        
        use warnings;
        use inc::Module::Build::Functions;
        
        require Module::Build::JSAN::Installable;
        build_class('Module::Build::JSAN::Installable');
        
        Module::Build::Functions::copy_package('Module::JSAN');
        Module::Build::Functions::copy_package('Module::Build::JSAN::Installable', 'true');
        
        Module::Build::Functions::_mb_required('0.35');
        
        my $old_get_builder = \&Module::Build::Functions::get_builder;
        
        no warnings;
        
        *Module::Build::Functions::get_builder = sub {
            *Module::Build::Functions::build_requires = sub {};
            *Module::Build::Functions::configure_requires = sub {};
            
            return &$old_get_builder();
        }
    }
}


__PACKAGE__;


=head1 NAME

Module::JSAN - Build JavaScript distributions for JSAN

=head1 VERSION

Version 0.01

=cut


=head1 SYNOPSIS

In F<Build.PL>:

    use inc::Module::JSAN;
    
    
    name            'Digest.MD5';
        
    version         '0.01';
        
    author          'SamuraiJack <root@symbie.org>';
    abstract        'JavaScript implementation of MD5 hashing algorithm';
        
    license         'perl';
        
    requires        'Cool.JS.Lib' => '1.1';
    requires        'Another.Cool.JS.Lib' => '1.2';
    
    
    build_requires  'Building.JS.Lib' => '1.1';
    build_requires  'Another.Building.JS.Lib' => '1.2';
    
    WriteAll;
    
or more relaxed dsl syntax:    

    use inc::Module::JSAN::DSL;
    
    
    name            Digest.MD5
        
    version         0.01
        
    author          'SamuraiJack <root@symbie.org>'
    abstract        'JavaScript implementation of MD5 hashing algorithm'
        
    license         perl
        
    requires        Cool.JS.Lib             1.1
    requires        Another.Cool.JS.Lib     1.2
    
    
    build_requires  Building.JS.Lib         1.1
    build_requires  Another.Building.JS.Lib 1.2
    

=head1 DESCRIPTION

This is a developer aid for creating JSAN distributions, which can be also installed in the local system. JSAN is the
"JavaScript Archive Network," a JavaScript library akin to CPAN. Visit L<http://www.openjsan.org/> for details.

This module works nearly identically to L<Module::Build::JSAN::Installable>, so please refer to
its documentation for additional details. The differnce is that this module provides a less perl-specifiec and more 
relaxed syntax for building scripts. 


=head1 WRITING A JSAN MODULE

This is a short tutorial on writing a simple JSAN module. Its really not that hard.


=head2 The Layout

The basic files in a module look something like this.

        Build.PL
        MANIFEST
        lib/Your/Module.js

See the synopsys above for the sample content of Build.PL.
That's all that's strictly necessary.  There's additional files you might want:

        lib/Your/Other/Module.js
        t/01_some_test.t.js
        t/02_some_other_test.t.js
        Changes
        README
        INSTALL
        MANIFEST.SKIP

=over 4

=item Build.PL

When you run Build.PL, it creates a 'Build' script.  That's the whole point of
Build.PL.  The 'Build' is a simple, cross-platform perl script, which loads
Module::Build::JSAN::Installable and couple of another modules to manage the 
distribution. 

Here's an example of what you need for a very simple module:

    use inc::Module::JSAN;

    name        'Your::Module';
    
    version     0.01;

'name' command indentifies the name of your distribution and 'version' - its version.
Pretty simple.

=item MANIFEST

A simple listing of all the files in your distribution.

        Build.PL
        MANIFEST
        lib/Your/Module.js

Filepaths in a MANIFEST always use Unix conventions (ie. /) even if you're
not on Unix.

You can write this by hand or generate it with './Build manifest' (or just 'Build manifest' on Windows).


=item lib/

This is the directory where your .js files you wish to have
installed go.  They are layed out according to namespace.  So Foo::Bar
is lib/Foo/Bar.js.


=item t/

Tests for your modules go here.  Each test filename ends with a .t.js.

Automated testing is not yet implemented. Please refer to documentation of various
testing tools on JSAN, like: L<http://openjsan.org/go?l=Test.Run> or L<http://openjsan.org/go?l=Test.Simple>.


=item Changes

A log of changes you've made to this module.  The layout is free-form.
Here's an example:

    1.01 Fri Apr 11 00:21:25 PDT 2003
        - thing() does some stuff now
        - fixed the wiggy bug in withit()

    1.00 Mon Apr  7 00:57:15 PDT 2003
        - "Rain of Frogs" now supported


=item README

A short description of your module, what it does, why someone would use it
and its limitations.  JSAN automatically pulls your README file out of
the archive and makes it available to JSAN users, it is the first thing
they will read to decide if your module is right for them.


=item INSTALL

Instructions on how to install your module along with any dependencies.
Suggested information to include here:

    any extra modules required for use
    the required javascript engine
    required operating systems/browsers


=item MANIFEST.SKIP

A file full of regular expressions to exclude when using './Build manifest' 
to generate the MANIFEST.  These regular expressions
are checked against each filepath found in the distribution (so
you're matching against "t/foo.t" not "foo.t").

Here's a sample:

    ~$          # ignore emacs and vim backup files
    .bak$       # ignore manual backups
    \b\.svn\b#  # ignore SVN directories
    ^\.git\b    # ignore top-level .git directory

Since # can be used for comments, # must be escaped.

Module::JSAN comes with a default MANIFEST.SKIP to avoid things like
version control directories and backup files. You can alter it alter it 
as necessary.


=head2 The Mantra

JSAN modules are installed using this simple mantra

        perl Build.PL
        ./Build
        ./Build test
        ./Build install

There are lots more commands and options, but the above will do it.


=head1 AUTHOR

Nickolay Platonov, C<< <nplatonov at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-module-jsan at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Module-JSAN>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Module::JSAN


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Module-JSAN>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Module-JSAN>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Module-JSAN>

=item * Search CPAN

L<http://search.cpan.org/dist/Module-JSAN/>

=back


=head1 ACKNOWLEDGEMENTS

Many thanks to Curtis Jewell, who's L<Module::Build::Functions> made this module possible.

Many thanks to Jarkko Hietaniemi for his ExtUtils::MakeMaker::Tutorial, form which a lot of content were borrowed.



=head1 COPYRIGHT & LICENSE

Copyright 2009 Nickolay Platonov, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut
