# ===========================================================================
# String::SetUTF8
# 
# Set/unset the internal UTF-8 flag for a string
# 
# Author: Alessandro Ranellucci <aar@cpan.org>
# Copyright (c) 2006.
# 
# Use this software AT YOUR OWN RISK.
# See below for documentation.
# 

package String::SetUTF8;

use strict;
use warnings;
use utf8;

our $VERSION = '1.00';

require Exporter;
our @ISA = qw[Exporter];
our @EXPORT = qw[setUTF8 unsetUTF8];

require XSLoader;
XSLoader::load('String::SetUTF8', $VERSION);

1;
__END__

=head1 NAME

String::SetUTF8 - Set/unset the internal UTF-8 flag for a string

=head1 SYNOPSIS

  use String::SetUTF8;
  
  setUTF8($string);
  unsetUTF8($string);

=head1 ABSTRACT

String::SetUTF8 lets you directly set or unset the UTF-8 flag for your 
strings. Sometimes you get binary data that Perl doesn't treat as UTF-8,
so instead of doing a trick with pack and unpack you can just use this 
module.

=head1 Why would I need this module

When you store UTF-8 data in a string, Perl sets an internal flag to 
remember that it's Unicode text. It will use that flag to handle any 
later encoding or input/output. Sometimes you get UTF-8 text while 
reading binary data, and Perl can't set its flag because it ignores
that it's UTF-8 text. There's a usual workaround to do this:

  $string = pack "U0C*", unpack "C*", $string;

However this may be difficult to remember, so I built this little 
String::SetUTF8 module that is by the way also much faster when working
on large amounts of data.

=head2 Example

To understand the problem just try the following snippet:

  my $string = "Hello \x{263A}!\n";  
  my $string2 = <DATA>;
  print "$ustring1$ustring2";
  __DATA__
  Hello ☺!

The first line will come out fine, while the second comes out garbles. 
This is because Perl knows that the first string is UTF-8, and doesn't 
know about encoding of the second. Then it tries to encode the second 
into UTF-8, while it shouldn't because it's already encoded.

=head2 What this module doesn't do

This module does not encode your data in Unicode, UTF-8 or others. 
It doesn't convert, transform or do any other similiar operation. 
It just tells Perl "this multibyte data is already UTF-8 encoded". 
Please don't use it unless you understand what you're doing.

=head1 Functions

=head2 setUTF8()

  setUTF8($string);

This sets the UTF-8 flag. It will die if you pass it a non-string variable.

=head2 unsetUTF8()

  unsetUTF8($string);

This unsets the UTF-8 flag. It will die if you pass it a non-string variable.

=head1 BUGS AND FEEDBACK

There are no known bugs. You are very welcome to write mail to the author 
(aar@cpan.org) with your contributions, comments, suggestions, bug reports 
or complaints.

=head1 AUTHOR

Alessandro Ranellucci E<lt>aar@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2006 Alessandro Ranellucci.
This module is free software, you may redistribute it and/or modify it under 
the same terms as Perl itself.

=head1 DISCLAIMER

This software is provided by the copyright holders and contributors ``as
is'' and any express or implied warranties, including, but not limited to,
the implied warranties of merchantability and fitness for a particular
purpose are disclaimed. In no event shall the regents or contributors be
liable for any direct, indirect, incidental, special, exemplary, or
consequential damages (including, but not limited to, procurement of
substitute goods or services; loss of use, data, or profits; or business
interruption) however caused and on any theory of liability, whether in
contract, strict liability, or tort (including negligence or otherwise)
arising in any way out of the use of this software, even if advised of the
possibility of such damage.

=cut
