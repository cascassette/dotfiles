# Source: https://gist.github.com/IrtezaAsadRizvi/619fe8b59cece46e367ff05598bd5e53
# ------------------------------------------------------------------------------
# fzf git branch picker (zsh)
#
# WHAT IT DOES
# - Fuzzy-search local git branches (newest first) and checkout on Enter.
# - Prints the current branch and last commit after switching.
#
# WHY IT SAVES TIME
# - No more typing long branch names; search + hit Enter.
# - Newest-first sort surfaces active work.
# - Immediate confirmation shows where you landed.
#
# PREREQUISITE: install fzf
# - macOS (Homebrew):
#     brew install fzf
#     "$(brew --prefix)/opt/fzf/install"   # optional keybindings
# - Linux (Debian/Ubuntu):
#     sudo apt update && sudo apt install fzf
# - Windows:
#   * Best via WSL (Ubuntu etc.): sudo apt install fzf
#   * Or Git Bash: scoop install fzf   |   choco install fzf
#
# SETUP (macOS zsh)
# 1) Paste this function into ~/.zshrc
# 2) Run:  source ~/.zshrc
# 3) Use:  gbr
#
# LINUX / WINDOWS NOTES
# - Linux zsh: same steps (use ~/.zshrc). Bash users: paste into ~/.bashrc and
#   change the function definition to `gbr() { ... }` (same body works).
# - Windows: use WSL or Git Bash; put it in the respective rc file (e.g., ~/.bashrc).
#
# TROUBLESHOOTING
# - If Enter does nothing: ensure the delimiter is a real TAB (we use printf "\t").
# - If you see "pathspec ... did not match": a literal "\t" snuck in—copy exactly.
# - If checkout fails: git will explain (e.g., unstaged changes). Commit/stash first.
#
#
# git branch picker, fzf git, fuzzy finder git, interactive git checkout,
# macOS zsh productivity, terminal git tools, switch git branches fast

# COPY FROM BELOW THIS LINE
# ------------------------------------------------------------------------------

#unalias gbr 2>/dev/null

# gbr: fuzzy-pick a local branch and git checkout it
gbr() {
  command -v fzf >/dev/null || { echo "fzf not found."; return 1; }
  command -v git >/dev/null || { echo "git not found."; return 1; }

  # Build display as: "<colored branch><TAB><raw branch>"
  # - We keep the raw branch in a hidden second field so checkout is robust.
  local sel branch
  sel=$(
    git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads \
    | awk '{printf "\033[1;36m%s\033[0m\t%s\n",$0,$0}' \
    | fzf --ansi --reverse --height=80% \
          --delimiter=$'\t' --with-nth=1 --preview-window=hidden
  ) || return 0

  # Extract the raw branch name (field 2), strip any CR
  branch=$(printf "%s" "$sel" | cut -f2 | tr -d '\r')
  [[ -z "$branch" ]] && { echo "No branch chosen."; return 1; }

  echo "→ git checkout ${branch}"
  if git checkout "$branch" || git checkout -t "origin/$branch"; then
    echo "✔ now on: $(git branch --show-current)"
    git --no-pager log -1 --oneline --decorate
  else
    echo "✖ checkout failed"
    return 1
  fi
}
