# NAME

Sub::Call::Tail - Tail calls for subroutines and methods

# SYNOPSIS

    use Sub::Call::Tail;

    # instead of @_ = ( $object, @args ); goto $object->can("method")
    tail $object->method(@args);

    # instead of @_ = @blah; goto &foo
    tail foo(@blah);

# DESCRIPTION

This module provides a `tail` modifier for subroutine and method calls that
will cause the invocation to have the same semantics as `goto &sub`.

When the `tail` modifier is compiled the inner subroutine call is transformed
at compile time into a goto.

# SEE ALSO

[B::Hooks::OP::Check::EntersubForCV](https://metacpan.org/pod/B::Hooks::OP::Check::EntersubForCV)

[CPS](https://metacpan.org/pod/CPS)

# VERSION CONTROL

[http://github.com/nothingmuch/Sub-Call-Tail](http://github.com/nothingmuch/Sub-Call-Tail)

# AUTHOR

Yuval Kogman

Andrew Main (Zefram)

# COPYRIGHT & LICENSE

        Copyright (c) 2009 Yuval Kogman. All rights reserved
        This program is free software; you can redistribute
        it and/or modify it under the same terms as Perl itself.
