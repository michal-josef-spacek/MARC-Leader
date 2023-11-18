package MARC::Leader;

use strict;
use warnings;

use Class::Utils qw(set_params);
use Data::MARC::Leader;
use Error::Pure qw(err);
use Scalar::Util qw(blessed);

our $VERSION = 0.02;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Process parameters.
	set_params($self, @params);

	return $self;
}

sub parse {
	my ($self, $leader) = @_;

	my %params = (
		'length' => int(substr $leader, 0, 5),
		'status' => (substr $leader, 5, 1),
		'type' => (substr $leader, 6, 1),
		'bibliographic_level' => (substr $leader, 7, 1),
		'type_of_control' => (substr $leader, 8, 1),
		'char_encoding_scheme' => (substr $leader, 9, 1),
		'indicator_count' => (substr $leader, 10, 1),
		'subfield_code_count' => (substr $leader, 11, 1),
		'data_base_addr' => int(substr $leader, 12, 5),
		'encoding_level' => (substr $leader, 17, 1),
		'descriptive_cataloging_form' => (substr $leader, 18, 1),
		'multipart_resource_record_level' => (substr $leader, 19, 1),
		'length_of_field_portion_len' => (substr $leader, 20, 1),
		'starting_char_pos_portion_len' => (substr $leader, 21, 1),
		'impl_def_portion_len' => (substr $leader, 22, 1),
		'undefined' => (substr $leader, 23, 1),
	);

	return Data::MARC::Leader->new(%params);
}

sub serialize {
	my ($self, $leader_obj) = @_;

	# Check object.
	if (! blessed($leader_obj) || ! $leader_obj->isa('Data::MARC::Leader')) {
		err "Bad 'Data::MARC::Leader' instance to serialize.";
	}

	my $leader = sprintf('%05d', $leader_obj->length).
		$leader_obj->status.
		$leader_obj->type.
		$leader_obj->bibliographic_level.
		$leader_obj->type_of_control.
		$leader_obj->char_encoding_scheme.
		$leader_obj->indicator_count.
		$leader_obj->subfield_code_count.
		sprintf('%05d', $leader_obj->data_base_addr).
		$leader_obj->encoding_level.
		$leader_obj->descriptive_cataloging_form.
		$leader_obj->multipart_resource_record_level.
		$leader_obj->length_of_field_portion_len.
		$leader_obj->starting_char_pos_portion_len.
		$leader_obj->impl_def_portion_len.
		$leader_obj->undefined;

	return $leader;
}

1;

__END__
