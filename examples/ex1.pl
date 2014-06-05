#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use Graph::Reader::OID;
use IO::Barf qw(barf);
use File::Temp qw(tempfile);

# Example data.
my $data = <<'END';
1.2.410.200047.11.2013.10234913023321120142141561581
1.2.276.0.7230010.3.0.3.6.1
END

# Temporary file.
my (undef, $tempfile) = tempfile();

# Save data to temp file.
barf($tempfile, $data);

# Reader object.
my $obj = Graph::Reader::OID->new;

# Get graph from file.
my $g = $obj->read_graph($tempfile);

# Print to output.
print $g."\n";

# Clean temporary file.
unlink $tempfile;

# Output:
# TODO