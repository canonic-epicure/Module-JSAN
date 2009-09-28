#line 1
package Module::JSAN;

use warnings;
use strict;

our $VERSION = '0.01';


sub import {
    
    {
        package main;
        use inc::Module::Build::Functions;
        
        Module::Build::Functions::copy_package('Module::JSAN');
        
        require Module::Build::JSAN::Installable;
        build_class('Module::Build::JSAN::Installable');
    }
}


__PACKAGE__;

__END__



#line 37


#line 60




#line 119
