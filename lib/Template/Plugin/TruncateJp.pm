package Template::Plugin::TruncateJp;

use strict;
use vars qw($VERSION);
$VERSION = 0.01;

require Template::Plugin;
use base qw(Template::Plugin);
use Jcode;

use vars qw($FILTER_NAME);
$FILTER_NAME = 'truncate_jp';

sub new {
    my($self, $context, @args) = @_;
    my $name = $args[0] || $FILTER_NAME;
    $context->define_filter($name, \&truncate_jp, 1);
    return $self;
}

sub truncate_jp {
    my ($context, @args) = @_;
    return sub {
        my $str = shift;
        my $len = $args[0];
        my $suf = defined $args[1] ? $args[1] : '...';
        if (length($str) <= $len) {
            return $str;
        }
        else {
            my ($line) = jcode($str)->jfold($len-length($suf));
            return $line.$suf;
        }
    };
}

1;
__END__

=head1 NAME

Template::Plugin::TruncateJp - TT Plugin to truncate the text block to the length specified for multibyte (japanese) characters

=head1 SYNOPSIS

  [% USE TruncateJp %]

  [% FILTER truncate_jp('10') -%]
  This is a sample text.
  [%- END %]

  # Output:
  # This is...

  [% 'This is a sample text. This is a sample text.' | truncate_jp('30', '... read more') %]

  # Output:
  # This is a sample ... read more

=head1 DESCRIPTION

Template::Plugin::TruncateJp is a plugin for TT, which is for multibyte characters instead of standard 'truncate' filter.
Truncated text will be terminated with the strings specified, or a default '...'.

=head1 AUTHOR

Satoshi Tanimoto E<lt>tanimoto@cpan.orgE<gt>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Template>

=cut
