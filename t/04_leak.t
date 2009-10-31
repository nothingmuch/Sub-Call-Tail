#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

use Sub::Call::Tail;

BEGIN {
    require constant;
    local $@;
    constant->import( HAS_PROCESS_INFO => not not eval { require Proc::ProcessTable; 1 } );
}

sub odd {
    my $n = shift;

    @_ = ( 1 .. 749 );

    return 0 if $n == 0;

    tail even($n - 1, "foo" x 1000, 1 .. 100);
}

sub even {
    return 1 if $_[0] == 0;

    my @foo = ( 1 .. 100 );

    tail odd($_[0] - 1, sub { scalar(@foo) . "foo" });
}

sub get_real_mem {
    if ( my ( $self ) = grep { $_->pid == $$ } @{Proc::ProcessTable->new->table} ) {
        return $self->size;
    } else {
        return 0;
    }
}

is( even(1), 0, "1 is odd" );
is( odd(1), 1, "1 is odd" );
is( odd(0), 0, "0 is even" );
is( even(0), 1, "0 is even" );
is( even(2), 1, "2 is even" );
is( odd(3), 1, "3 is odd" );

is( even(10000), 1, "10000 is even" );

sub large_number {
    my $num = shift;

    my $real_mem = HAS_PROCESS_INFO && get_real_mem();

    is( odd($num), ($num % 2), "odd($num)" );

    SKIP: {
        skip "Proc::ProcessTable required for memory size check", 1 unless HAS_PROCESS_INFO;
        is( get_real_mem, $real_mem, "memory size not grow" );
    }
}

my $leak_max = $ENV{TAILCALL_LEAK_TEST} || 10000;

foreach my $num ( grep { $_ <= $leak_max } 3, 1000, 10000, 100001, 1000001, 47185437, 1734873865 ) {
    large_number($num);
}

done_testing;



# ex: set sw=4 et:

