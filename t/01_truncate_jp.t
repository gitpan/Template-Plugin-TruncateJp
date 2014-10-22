# This script in EUC-JP
use strict;
use Template::Test;

test_expect(\*DATA);

__END__
--test--
[% USE TruncateJp('truncjp') -%]
[% FILTER truncjp('11') -%]
��������������������
[%- END %]
--expect--
��������...
--test--
[% USE TruncateJp -%]
[% '��������������������' | truncate_jp('10') -%]
--expect--
������...
--test--
[% USE TruncateJp -%]
[% FILTER truncate_jp('10') -%]
��������������������
[%- END %]
--expect--
������...
--test--
[% USE TruncateJp -%]
[% FILTER truncate_jp('10') -%]
��������������������
[%- END %]
--expect--
������...
--test--
[% USE TruncateJp -%]
[% FILTER truncate_jp('10') -%]
����������
[%- END %]
--expect--
����������
--test--
[% USE TruncateJp -%]
[% FILTER truncate_jp('10','..') -%]
����������0
[%- END %]
--expect--
��������..
--test--
[% USE TruncateJp -%]
[% FILTER truncate_jp('10','') -%]
����������0
[%- END %]
--expect--
����������
--test--
[% USE TruncateJp -%]
[% FILTER truncate_jp('11','') -%]
����������0
[%- END %]
--expect--
����������0
--test--
[% USE TruncateJp -%]
[% FILTER truncate_jp('10') -%]
This is a sample text.
[%- END %]
--expect--
This is...
--test--
[% USE TruncateJp -%]
[% 'This is a sample text. This is a sample text.' | truncate_jp('30', '... read more') %]
--expect--
This is a sample ... read more
