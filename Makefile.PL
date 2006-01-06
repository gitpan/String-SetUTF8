use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

WriteMakefile(
	AUTHOR			=> 'Alessandro Ranellucci <aar@cpan.org>',
	NAME      		=> 'String::SetUTF8',
    ABSTRACT		=> 'Set/unset the internal UTF-8 flag for a string',
	VERSION_FROM 	=> 'SetUTF8.pm',
    'dist'         	=> { COMPRESS => 'gzip', SUFFIX => 'gz' }
);
