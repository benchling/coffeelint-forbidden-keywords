module.exports = class ForbiddenKeywords
  rule:
    name: 'forbidden_keywords'
    level: 'error'
    message: 'The keyword is forbidden'
    forbidden:
      'yes': 'true'
      'no': 'false'
      'on': 'true'
      'off': 'false'
      # Some other reasonable replacements:
      # 'is': '=='
      # 'isnt': '!='
      # 'unless': 'if not'
      # 'loop': 'while true'
      # 'until': 'while not'
      # '..': 'a...(b+1)'
      # '++': '+=1'
      # '--': '-=1'
    description: '''
      This rule forbids the usage of a specified subset of the following keywords:
        this, if, unless, while, loop, until, true, yes, on, false, no, off,
        is, ==, isnt, !=, !, not, &&, and, ||, or, ++, --, .., ...
      By default, ['yes', 'no', 'on', 'off'] are forbidden.
      '''

  tokens: [
    'THIS', 'IF', 'LOOP', 'UNTIL', 'BOOL', 'UNARY', 'UNARY_MATH', 'COMPARE',
    'LOGIC', 'LOOP', '++', '--', '..', '...'
  ]

  lintToken: (token, tokenApi) ->
    {forbidden} = tokenApi.config[@rule.name]

    # Determine the token's original keyword.
    [type, value, pos] = token
    line = tokenApi.lines[tokenApi.lineNumber]
    keyword = line[pos.first_column..pos.last_column]

    # Error if the keyword is in the rules.forbidden hash.
    if keyword of forbidden
      replacement = forbidden[keyword]
      error =
        message: if replacement?
          "The \"#{keyword}\" keyword is forbidden. Use \"#{replacement}\" instead"
        else
          "The \"#{keyword}\" keyword is forbidden"
      return error
    return
