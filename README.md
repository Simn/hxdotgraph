## <span class="milestone_open">3.3</span>

### <span class="issue_open">Unicode support</span>

We want to add to the standard library, fully tested versions of the following classes:
- haxe.Ucs2
- haxe.Utf8
- haxe.Utf16
They will be implemented as abstracts and will follow the String API + conversions between them and fromBytes/toBytes.

### <span class="issue_closed">Bytes support</span>

- make sure we use typed Arrays in JS, and emulate it on IE8
- allow to get a view of a sub part of the Bytes similar to JS typed arrays
- we need both DataView http://api.haxe.org/js/html/DataView.html and all the [U][Int|Float|Double][8|16|32]Array types

