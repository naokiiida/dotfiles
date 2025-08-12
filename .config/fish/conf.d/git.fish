function git-clone-folder
    set repo_url $argv[1]
    set folder_path $argv[2]
    set repo_name (basename $repo_url .git)

    if test -z "$repo_url" -o -z "$folder_path"
        echo "Usage: git-clone-folder <repository-url> <folder-path>"
        return 1
    end

    git clone --depth=1 --no-checkout "$repo_url" "$repo_name" && cd "$repo_name" && git sparse-checkout init && echo "$folder_path/" >.git/info/sparse-checkout && git checkout
end

alias gitf="git-clone-folder"
