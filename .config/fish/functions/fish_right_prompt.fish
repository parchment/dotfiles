# Based on: Git Index right prompt for fish by christhekeele
# https://github.com/christhekeele/dotfiles/blob/master/config/fish/functions/fish_right_prompt.fish

function fish_right_prompt --description 'Write out the prompt'
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1

    echo -n -s ' '

    ####
    # Index status
    ##

    set deletions_staged        0
    set deletions_unstaged      0
    set deletions_ours          0
    set deletions_theirs        0

    set additions_staged        0
    set additions_unstaged      0
    set additions_ours          0
    set additions_theirs        0

    set modifications_staged    0
    set modifications_unstaged  0
    set modifications_ours      0
    set modifications_theirs    0

    git status --porcelain --ignore-submodules=none | while read --delimiter "\n" -l line

      # Compute deletions
      string match -q -r "^D[\sMT]\s*" $line;          and set deletions_staged (math $deletions_staged + 1)
      string match -q -r "^[\sACMRT]D\s*" $line;       and set deletions_unstaged (math $deletions_unstaged + 1)
      string match -q -r "^D[DU]\s*" $line;            and set deletions_ours (math $deletions_ours + 1)
      string match -q -r "^[DU]D\s*" $line;            and set deletions_theirs (math $deletions_theirs + 1)

      # Compute additions
      string match -q -r "^[AC][\sDMT]\s*" $line;      and set additions_staged (math $additions_staged + 1)
      string match -q -r "^\?\?\s*" $line;             and set additions_unstaged (math $additions_unstaged + 1)
      string match -q -r "^A[AU]\s*" $line;            and set additions_ours (math $additions_ours + 1)
      string match -q -r "^[AU]A\s*" $line;            and set additions_theirs (math $additions_theirs + 1)

      # Compute modifications
      string match -q -r "^[MRT][\sDMT]\s*" $line;     and set modifications_staged (math $modifications_staged + 1)
      string match -q -r "^[\sACMDRT][MRT]\s*" $line;  and set modifications_unstaged (math $modifications_unstaged + 1)
      string match -q -r "^U.\s*" $line;               and set modifications_ours (math $modifications_ours + 1)
      string match -q -r "^.U\s*" $line;               and set modifications_theirs (math $modifications_theirs + 1)

    end

    # Number of all changes
    set changes (math $deletions_staged + $deletions_unstaged +  $additions_staged + $additions_unstaged + $modifications_staged + $modifications_unstaged)

    # Render deletions
    if test $changes -gt 0
      if test $deletions_staged -gt 0; and test $deletions_unstaged -gt 0
        echo -n -s (set_color yellow) "❮" (set_color normal)
      else if test $deletions_staged -gt 0
        echo -n -s (set_color green) "❮" (set_color normal)
      else if test $deletions_unstaged -gt 0
        echo -n -s (set_color red) "❮" (set_color normal)
      else
        echo -n -s (set_color brblack) "❮" (set_color normal)
      end
    else
      echo -n -s (set_color brblack --dim) "❮" (set_color normal)
    end

    # Render additions
    if test $changes -gt 0
      if test $additions_staged -gt 0; and test $additions_unstaged -gt 0
        echo -n -s (set_color yellow) "❮" (set_color normal)
      else if test $additions_staged -gt 0
        echo -n -s (set_color green) "❮" (set_color normal)
      else if test $additions_unstaged -gt 0
        echo -n -s (set_color red) "❮" (set_color normal)
      else
        echo -n -s (set_color brblack) "❮" (set_color normal)
      end
    else
      echo -n -s (set_color brblack --dim) "❮" (set_color normal)
    end

    # Render modifications
    if test $changes -gt 0
      if test $modifications_staged -gt 0; and test $modifications_unstaged -gt 0
        echo -n -s (set_color yellow) "❮" (set_color normal)
      else if test $modifications_staged -gt 0
        echo -n -s (set_color green) "❮" (set_color normal)
      else if test $modifications_unstaged -gt 0
        echo -n -s (set_color red) "❮" (set_color normal)
      else
        echo -n -s (set_color brblack) "❮" (set_color normal)
      end
    else
      echo -n -s (set_color brblack --dim) "❮" (set_color normal)
    end

    echo -n -s ' '

    ####
    # HEAD status
    ##

    set short_sha (git rev-parse -q --short HEAD)
    set branch (git symbolic-ref -q --short HEAD)

    if test -n "$branch"
      echo -n -s (set_color cyan) $branch (set_color normal)
    else
      echo -n -s (set_color red --bold) $short_sha (set_color normal)
    end

    echo -n -s ' '

  end
end
