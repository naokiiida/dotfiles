function git-clone-folder
    set repo_url $argv[1]
    set folder_path $argv[2]
    set repo_name (basename $repo_url .git)

    if test -z "$repo_url" -o -z "$folder_path"
        echo "Usage: git-clone-folder <repository-url> <folder-path>"
        return 1
    end

    git clone --depth=1 --no-checkout "$repo_url" "$repo_name"
    or begin
        echo "Failed to clone repository."
        return 1
    end

    echo "Sparse-checkout $folder_path"
    git -C "$repo_name" sparse-checkout set "$folder_path"
    or begin
        echo "Failed to set sparse-checkout folder."
        return 1
    end

    git -C "$repo_name" checkout
    or begin
        echo "Failed to checkout files."
        return 1
    end
end

alias gitf="git-clone-folder"

alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotl='/opt/homebrew/bin/lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias gi="/opt/homebrew/bin/lazygit"

function g1
    set repo_url $argv[1]
    set repo_name (basename $repo_url .git)
    git clone --depth=1 "$repo_url" && cd "$repo_name"
end
