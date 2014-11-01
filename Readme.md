Encodings. Wtf?

Script was blowing up depending on how it was read in (`File.read` vs `File.open` with a block vs `File.open` without a block).
I figured out how to get it to do the right thing, but have no fucking clue how to explain any of this,
or necessarily to deal with this if I ever see it again.

So, here is what I have found out:

* Despite the `encoding` magic comment, it still picks utf-8
* Despite the `--encoding external:internal` flag, it still picks utf-8 and nil
* Despite the `--external-encoding` flag, it still picks utf-8
* Despite the `--internal-encoding` flag, it still picks nil
* Despite the OS saying it's `iso-8859-1` encoding, Ruby picks `utf-8`
* In order to be able to read it, I must convert encodings to utf-8 (or is this an artifact of my American computer? Do people in other countries maintain non-utf8 encodings and they display just fine?)
* regardless of encoding, "ç" is not matched by `/\w/`

LICENSE: Public domain
