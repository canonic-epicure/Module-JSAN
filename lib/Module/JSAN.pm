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

__END__



=head1 NAME

Module::JSAN - Convenience wrapper

=head1 VERSION

Version 0.01

=cut


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

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
    
    create_makefile_pl  'passthrough';
    
    WriteAll;

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 FUNCTIONS

=head2 function1

=cut




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


=head1 COPYRIGHT & LICENSE

Copyright 2009 Nickolay Platonov, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut
