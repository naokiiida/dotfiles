# Claude Code CLI Proxy API Functions
# Launch Claude Code with different model groups (Gemini, Anthropic, OpenAI)
# Version 2.x.x configuration

function claude-gemini --description 'Launch Claude Code with Gemini models'
    env \
        ANTHROPIC_BASE_URL=http://127.0.0.1:8317 \
        ANTHROPIC_AUTH_TOKEN=sk-dummy \
        ANTHROPIC_DEFAULT_OPUS_MODEL=gemini-3-pro-preview \
        ANTHROPIC_DEFAULT_SONNET_MODEL=gemini-2.5-flash \
        ANTHROPIC_DEFAULT_HAIKU_MODEL=gemini-2.5-flash-lite \
        /opt/homebrew/bin/claude $argv
end

function claude-anthropic --description 'Launch Claude Code with Anthropic models'
    env \
        ANTHROPIC_BASE_URL=http://127.0.0.1:8317 \
        ANTHROPIC_AUTH_TOKEN=sk-dummy \
        ANTHROPIC_DEFAULT_OPUS_MODEL=claude-opus-4-5-20251101 \
        ANTHROPIC_DEFAULT_SONNET_MODEL=claude-sonnet-4-5-20250929 \
        ANTHROPIC_DEFAULT_HAIKU_MODEL=claude-haiku-4-5-20251001 \
        /opt/homebrew/bin/claude $argv
end

function claude-openai --description 'Launch Claude Code with OpenAI models'
    env \
        ANTHROPIC_BASE_URL=http://127.0.0.1:8317 \
        ANTHROPIC_AUTH_TOKEN=sk-dummy \
        ANTHROPIC_DEFAULT_OPUS_MODEL=gpt-5.1 \
        ANTHROPIC_DEFAULT_SONNET_MODEL=gpt-5 \
        ANTHROPIC_DEFAULT_HAIKU_MODEL=gpt-5-mini \
        /opt/homebrew/bin/claude $argv
end

function claude-antigravity --description 'Launch Claude Code with Antigravity models'
    env \
        ANTHROPIC_BASE_URL=http://127.0.0.1:8317 \
        ANTHROPIC_AUTH_TOKEN=sk-dummy \
        ANTHROPIC_DEFAULT_OPUS_MODEL=gemini-claude-opus-4-5-thinking \
        ANTHROPIC_DEFAULT_SONNET_MODEL=gemini-claude-sonnet-4-5 \
        ANTHROPIC_DEFAULT_HAIKU_MODEL=gemini-2.5-flash \
        /opt/homebrew/bin/claude $argv
end

function claude-copilot-anthropic --description 'Launch Claude Code with Copilot-hosted Claude models'
    env \
        ANTHROPIC_BASE_URL=http://127.0.0.1:8317 \
        ANTHROPIC_AUTH_TOKEN=sk-dummy \
        ANTHROPIC_DEFAULT_OPUS_MODEL=claude-opus-4.5 \
        ANTHROPIC_DEFAULT_SONNET_MODEL=claude-sonnet-4.5 \
        ANTHROPIC_DEFAULT_HAIKU_MODEL=claude-haiku-4.5 \
        /opt/homebrew/bin/claude $argv
end

alias ccg claude-gemini
alias cco claude-openai
alias cca claude-antigravity
alias ccc claude-copilot-anthropic
