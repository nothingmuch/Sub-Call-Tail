package Sub::Call::Tail;

use strict;
use warnings;

require 5.008001;
use parent qw(Exporter DynaLoader);
use B::Hooks::OP::Check::EntersubForCV;

our $VERSION = '0.02';
$VERSION = eval $VERSION;

our @EXPORT = our @EXPORT_OK = qw(tail);
our %EXPORT_TAGS = ( all => \@EXPORT_OK );

__PACKAGE__->bootstrap($VERSION);

pop our @ISA;

# ex: set sw=4 et:

__PACKAGE__

__END__

=pod

=head1 NAME

Sub::Call::Tail - Tail calls for subroutines and methods

=head1 SYNOPSIS

    use Sub::Call::Tail;

    # instead of @_ = ( $object, @args ); goto $object->can("method")
    tail $object->method(@args);

    # instead of @_ = @blah; goto &foo
    tail foo(@blah);

=head1 DESCRIPTION

This module provides a C<tail> modifier for subroutine and method calls that
will cause the invocation to have the same semantics as C<goto &sub>.

When the C<tail> modifier is compiled the inner subroutine call is transformed
at compile time into a goto.

=head1 SEE ALSO

L<B::Hooks::OP::Check::EntersubForCV>

L<CPS>

=head1 VERSION CONTROL

L<http://github.com/nothingmuch/Sub-Call-Tail>

=head1 AUTHOR

Yuval Kogman

Andrew Main (Zefram)

=head1 COPYRIGHT & LICENSE

	Copyright (c) 2009 Yuval Kogman. All rights reserved
	This program is free software; you can redistribute
	it and/or modify it under the same terms as Perl itself.

=cut
