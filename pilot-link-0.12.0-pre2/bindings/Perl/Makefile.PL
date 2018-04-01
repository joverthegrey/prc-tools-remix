use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

$prefix = "/usr/local";
$exec_prefix = "${prefix}";
$libdir = "../../libpisock/.libs";

$lib = "-L$libdir -lpisock";

WriteMakefile(
    'NAME'       => 'PDA::Pilot',
    'VERSION'    => '0.12.0',
    'XSPROTOARG' => '-noprototypes',
    'INC'        => '-I../../include',
    'DEFINE'     => '-DPERL_POLLUTE',
    dynamic_lib  => {'OTHERLDFLAGS' => $lib}
);
