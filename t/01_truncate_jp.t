# This script in EUC-JP
use strict;
use Template::Test;

test_expect(\*DATA);

__END__
--test--
[% USE TruncateJp('truncjp') -%]
[% FILTER truncjp('11') -%]
あいうえおかきくけこ
[%- END %]
--expect--
あいうえ...
--test--
[% USE TruncateJp -%]
[% 'あいうえおかきくけこ' | truncate_jp('10') -%]
--expect--
あいう...
--test--
[% USE TruncateJp -%]
[% FILTER truncate_jp('10') -%]
あいうえおかきくけこ
[%- END %]
--expect--
あいう...
--test--
[% USE TruncateJp -%]
[% FILTER truncate_jp('10') -%]
ｱｲｳｴｵかきくけこ
[%- END %]
--expect--
ｱｲｳ...
--test--
[% USE TruncateJp -%]
[% FILTER truncate_jp('10') -%]
アイウエオ
[%- END %]
--expect--
アイウエオ
--test--
[% USE TruncateJp -%]
[% FILTER truncate_jp('10','..') -%]
アイウエオ0
[%- END %]
--expect--
アイウエ..
--test--
[% USE TruncateJp -%]
[% FILTER truncate_jp('10','') -%]
アイウエオ0
[%- END %]
--expect--
アイウエオ
--test--
[% USE TruncateJp -%]
[% FILTER truncate_jp('11','') -%]
アイウエオ0
[%- END %]
--expect--
アイウエオ0
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
