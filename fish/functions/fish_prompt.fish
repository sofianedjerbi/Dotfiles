# Author: Sofiane DJERBI (@Kugge).
# Prompt theme for fish

##########
# PROMPT #
##########

# Fish shell prompt
function fish_prompt
    # Vars
    set -l last_command_status $status
    set -l symbol 'Ω'

    # Color setup
    set -l normal_color (set_color normal)
    set -l branch_color (set_color yellow)
    set -l meta_color (set_color red)
    set -l symbol_color (set_color blue -o)
    set -l error_color (set_color red -o)

    # If we're in a git repo
    if git_is_repo
        # Get branch name
        set -l branch (git symbolic-ref --short HEAD)
        # Echo branch name
        echo -n -s $branch_color $branch $normal_color
        # Cumuled git status:
        set -l git_meta ""
        # Check if files are added
        if test (git ls-files --others --exclude-standard | wc -w) -gt 0
            set git_meta "$git_meta?/"
        end
        # Check if files are stashed
        if test (git stash list | wc -l) -gt 0
            set git_meta "$git_meta✮/"
        end
        # Check if dirty/staged
        if git diff --no-ext-diff --quiet --exit-code
            git_is_dirty && set git_meta "$git_meta⨯/"
            git_is_staged && set git_meta "$git_meta●/"
        end
        # Get the nb of commits
        set -l commit_count (git rev-list --count --left-right (git remote)/$branch...HEAD)
        set -l behind (echo $commit_count | cut -f 1)
        set -l ahead (echo $commit_count | cut -f 2)
        # If behind/ahead/even
        if test $behind -gt 0
            set git_meta "$git_meta⏷"
        else if test $ahead -gt 0
            set git_meta "$git_meta⏶"
        else
            set git_meta "$git_meta✔"
        end
        # Print meta infos
        if test $git_meta
            echo -n -s $meta_color " " $git_meta " " $normal_color
        else
            echo -n -s " "
        end
    end

    if test $last_command_status -eq 0
        echo -n -s $symbol_color $symbol " " $normal_color
    else
        echo -n -s $error_color $symbol " " $normal_color
    end
end
