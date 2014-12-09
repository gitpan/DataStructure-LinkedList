package DataStructure::LinkedList::Cell;

use 5.006;
use strict;
use warnings FATAL => 'all';
use parent qw/Class::Accessor/;
__PACKAGE__->mk_accessors(qw/next data/);
use Scalar::Util qw/blessed looks_like_number/;
use Carp;

sub new {
    my $class = shift;
    my $next = undef;
    my $data = shift;
    bless { next => $next, data => $data }, $class;
}

sub compare_to {
    my $self = shift;
    my $cell = shift;

    # some object case
    if (blessed($self->data)) {
        # you have to implement compare_to method in your obj
        if (!$cell->can('compare_to')) {
            croak "You have to implement compare_to method in your object(" . ref($cell) . ").\n";
        }
        return $cell->compare_to($self->data) > 0 ? 1 : 0;
    }

    if (looks_like_number($self->data)) {
        # number case
        return $self->data > $cell->data ? 1 : 0;
    } else {
        # string case
        return $self->data gt $cell->data ? 1 : 0;
    }

    # other case (havn't implemented)
    return 1;
}

1;
