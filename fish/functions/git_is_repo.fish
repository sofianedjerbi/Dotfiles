# Author: OhMyFish devs
# Forked by Sofiane DJERBI (@Kugge)
# Check if the active dir is a repo

function git_is_repo -d "Check if directory is a repository"
  test -d .git
  or begin
    set -l info (command git rev-parse --git-dir --is-bare-repository 2>/dev/null)
    and test $info[2] = false
  end
end
