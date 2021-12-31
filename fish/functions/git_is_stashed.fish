# Author: OhMyFish devs
# Forked by Sofiane DJERBI (@Kugge)
# Check if the git is stashed

function git_is_stashed -d "Check if repo has stashed contents"
    command git rev-parse --verify --quiet refs/stash >/dev/null
end

