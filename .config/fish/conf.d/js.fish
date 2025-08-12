function p
    if test -f bun.lockb
        command bun $argv
    else if test -f pnpm-lock.yaml
        command pnpm $argv
    else if test -f deno.json
        command deno $argv
    else if test -f yarn.lock
        command pnpm import
    else if test -f package-lock.json
        command pnpm import
    else
        command pnpm $argv
    end
end

alias npm='pnpm'
