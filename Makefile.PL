use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'      => 'Template::Plugin::TruncateJp',
    'VERSION_FROM' => 'lib/Template/Plugin/TruncateJp.pm', # finds $VERSION
    'PREREQ_PM' => {
	'Test::More' => 0.32,
	'Template'   => 2.07,
	'Jcode'      => 0.62,
    },
);
