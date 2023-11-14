package MARC::Leader;

use strict;
use warnings;

use Class::Utils qw(set_params);
use Error::Pure qw(err);

our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Leader raw string.
	$self->{'leader'} = undef;

	# Process parameters.
	set_params($self, @params);

	# Check leader.
	if (! defined $self->{'leader'}) {
		err "Parameter 'leader' is required.";
	}

	# Parse leader.
	$self->_parse_leader;

	return $self;
}

sub _parse_leader {
	my $self = shift;

	# TODO
}

1;

__END__
