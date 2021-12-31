# Author: Sofiane DJERBI (@Kugge)
# Fish init script

# If it's an interactive shell
if status is-interactive
    # Source gentoo env variables
    #bass source /etc/profile
    # Update completions in the background
    fish -c "fish_update_completions >/dev/null" &
    # Enable vi mode
    #fish_vi_cursor
    #fish_vi_key_bindings
end

