# function git-clone-folder
#     set repo_url $argv[1]
#     set folder_path $argv[2]
#     set repo_name (basename $repo_url .git)

#     if test -z "$repo_url" -o -z "$folder_path"
#         echo "Usage: git-clone-folder <repository-url> <folder-path>"
#         return 1
#     end

#     git clone --depth=1 --no-checkout "$repo_url" "$repo_name" && cd "$repo_name" && git sparse-checkout init && echo "$folder_path/" >.git/info/sparse-checkout && git checkout
# end

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
