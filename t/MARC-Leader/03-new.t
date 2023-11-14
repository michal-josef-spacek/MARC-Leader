use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use MARC::Leader;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = MARC::Leader->new(
	'leader' => '02200cem a2200541 i 4500',
);
isa_ok($obj, 'MARC::Leader');

# Test.
eval {
	MARC::Leader->new;
};
is($EVAL_ERROR, "Parameter 'leader' is required.\n",
	"Parameter 'leader' is required.");
clean();
