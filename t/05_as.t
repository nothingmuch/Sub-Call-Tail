#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

use Sub::Call::Tail tail => { -as => 'tail_call' };

sub bar { "baz" };

sub foo {
    tail_call bar();
}

sub tests {
    is foo(), 'baz', 'tail_call worked ok';
}

tests();

done_testing;

# ex: set sw=4 et:

