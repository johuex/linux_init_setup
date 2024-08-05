export WG_QUICK_USERSPACE_IMPLEMENTATION=boringtun-cli
export WG_SUDO=1

function gbrr() {
    # git branch remote rename
    # Rename local & remote branch in git repo
    old_name="${1}"
    new_name="${2}"
    git branch -m $old_name $new_name
    git push origin --delete $old_name
    git push origin -u $new_name
}
