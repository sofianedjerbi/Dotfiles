# Author: OhMyFish devs
# Forked by Sofiane DJERBI (@Kugge)
# Check if the git is staged

function git_is_staged -d "Check if repo has staged changes"
    not command git diff --cached --no-ext-diff --quiet --exit-code
end

