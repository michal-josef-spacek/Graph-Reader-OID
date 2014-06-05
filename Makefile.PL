# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Perl class for reading a graph from OID format.';
author 'Michal Špaček <skim@cpan.org>';
license 'bsd';
name 'Graph-Reader-OID';
readme_from 'OID.pm';
requires 'Graph::Reader' => 0;
requires 'perl' => '5.6.2';
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=Graph-Reader-OID';
resources 'homepage' => 'https://github.com/tupinek/Graph-Reader-OID';
resources 'repository' => 'git://github.com/tupinek/Graph-Reader-OID';
test_requires 'Encode' => 0;
test_requires 'English' => 0;
test_requires 'File::Object' => 0.07;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
