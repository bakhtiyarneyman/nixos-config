{ lib, ... }:

let
  logo = builtins.readFile ./logos/little_sus.txt;
in with lib; ''
  -- dashboard {{{
    do
      local g = vim.g

      g.dashboard_custom_header = {${
        concatMapStrings (line: "'${line}',") (splitString "\n" logo)
      }}

      g.dashboard_custom_footer = {
        'Your code is little sus'
      }
    end
  -- }}}
''