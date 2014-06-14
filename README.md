coffeelint-forbidden-tokens
==============================

A CoffeeLint rule that forbids specified keywords.

Description
-----------

This [CoffeeLint](http://www.coffeelint.org/) forbids the usage of a specified subset of
the following keywords:

  if, unless, while, loop, until, true, yes, on, false, no, off, is, ==, isnt, !=, !, not, &&, and,
  ||, or, ++, --, .., ...

By default, 'yes', 'no', 'on', and 'off' are forbidden.

Installation
------------

```sh
npm install coffeelint-forbidden-keywords
```

Usage
-----

Add the following configuration to `coffeelint.json`:

```json
"forbidden_keywords": {
  "module": "coffeelint-forbidden-keywords"
}
```

Configuration
-------------

**forbidden**: a hash that maps forbidden keywords to suggested replacements. To forbid a keyword
  with no suggestion, map the keyword to null.

For example:

```json
"forbidden_keywords": {
  "module": "coffeelint-forbidden-keywords",
  "forbidden": {
    "yes": "true",
    "no": "false",
    "on": "true",
    "off": "false",
    "is": "==",
    "isnt": "!="
  }
}
```
