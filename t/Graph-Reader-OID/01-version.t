# Pragmas.
use strict;
use warnings;

# Modules.
use Graph::Reader::OID;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Graph::Reader::OID::VERSION, 0.01, 'Version.');
