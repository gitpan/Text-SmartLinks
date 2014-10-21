use v6;

use Test;

=begin pod

This file was derived from the perl5 CPAN module Perl6::Rules,
version 0.3 (12 Apr 2004), file t/assert.t.

It has (hopefully) been, and should continue to be, updated to
be valid perl6.
# L<< S05/"Extensible metasyntax (C<< <...> >>)"/"A leading C<?{> or C<!{> indicates a code assertion:" >>

=end pod

ok("1"       ~~ m/ (\d) <?{$0 < 5}> /,           '1 < 5');
ok("5"      !~~ m/ (\d) <?{$/[*-1] < 5}>/,       '5 !< 5');

# L<S07/"Other Extensible metasyntax (C<< <...> >>)"/"A leading C<?{> or C<!{> indicates a code:" >

ok(" x 254"  ~~ m/x (\d+): <?{$/[*-1] < 255}> /, '254 < 255');
ok(" x 255" !~~ m/x (\d+): <?{$/[*-1] < 255}> /, '255 !< 255');

# leading slash is not good
# L</S05/Modifiers/With the new C<:ov> (C<:overlap>) modifier,>

ok(" x 255" !~~ m/x (\d+): <?{$/[*-1] < 255}> /, '255 !< 255');
