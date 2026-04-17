# Lefthook completion for Fish shell v4

complete -c lefthook -f -d "Git hooks manager"

# Subcommands
complete -c lefthook -a "install" -d "Install git hooks"
complete -c lefthook -a "run" -d "Run a hook"
complete -c lefthook -a "help" -d "Show help information"
complete -c lefthook -a "version" -d "Show version information"
complete -c lefthook -a "uninstall" -d "Uninstall git hooks"
complete -c lefthook -a "info" -d "Show configuration info"
complete -c lefthook -a "check-install" -d "Check if hooks are installed"
complete -c lefthook -a "dump" -d "Print merged config"
complete -c lefthook -a "add" -d "Add scripts directory and install hook"
complete -c lefthook -a "validate" -d "Validate lefthook config"

# Global options
complete -c lefthook -s h -l help -d "Show help"
complete -c lefthook -s v -l version -d "Show version"
complete -c lefthook -l no-color -d "Disable colored output"

# Run subcommand options
complete -c lefthook -n "__fish_seen_subcommand_from run" -s a -l all -d "Run all hooks"
complete -c lefthook -n "__fish_seen_subcommand_from run" -s d -l debug -d "Enable debug mode"
