package Graph::Reader::OID;

# Pragmas.
use base qw(Graph::Reader);
use strict;
use warnings;

# Version.
our $VERSION = 0.01;

# Read graph subroutine.
sub _read_graph {
	my ($self, $graph, $fh) = @_;
	while (my $line = <$fh>) {
		chomp $line;

		# End of vertexes section.
		if ($line =~ m/^#/ms) {
			next;
		}

		# Process OID.
		my @oid = split m/\./ms, $line;
		my $last_oid;
		foreach my $oid (@oid) {
			$graph->add_vertex($oid);
			if (defined $last_oid) {
				$graph->add_edge($last_oid, $oid);
			}
		}
	}
	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Graph::Reader::OID - Perl class for reading a graph from OID format.

=head1 SYNOPSIS

 use Graph::Reader::OID;
 my $obj = Graph::Reader::OID->new;
 my $graph = $obj->read_graph($oid_file);

=head1 METHODS

=over 8

=item C<new()>

 Constructor.
 This doesn't take any arguments.
 Returns Graph::Reader::OID object.

=item C<read_graph($tgf_file)>

 Read a graph from the specified file.
 The argument can either be a filename, or a filehandle for a previously opened file.
 Returns Graph object.

=back

=head1 OID FILE FORMAT

 File format with OID list.
 For OID (Object identifier) see L<Object identifier|https://en.wikipedia.org/wiki/Object_identifier>
 Example:
 1.2.410.200047.11.2013.10234913023321120142141561581
 1.2.276.0.7230010.3.0.3.6.1

=head1 EXAMPLE

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

=head1 DEPENDENCIES

L<Graph::Reader>.

=head1 SEE ALSO

L<Graph::Reader>,
L<Graph::Reader::Dot>,
L<Graph::Reader::HTK>,
L<Graph::Reader::LoadClassHierarchy>,
L<Graph::Reader::UnicodeTree>,
L<Graph::Reader::TGF>,
L<Graph::Reader::TGF::CSV>,
L<Graph::Reader::XML>.

=head1 REPOSITORY

L<https://github.com/tupinek/Graph-Reader-OID>

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

BSD license.

=head1 VERSION

0.01

=cut
