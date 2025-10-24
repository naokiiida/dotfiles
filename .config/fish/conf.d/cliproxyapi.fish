# Claude Code CLI Proxy API Functions
# Launch Claude Code with different model configurations through the CLI Proxy API server

function claude-gemini-pro --description 'Launch Claude Code with Gemini 2.5 Pro models'
    env \
        ANTHROPIC_BASE_URL=http://127.0.0.1:8317 \
        ANTHROPIC_AUTH_TOKEN=gemini \
        ANTHROPIC_MODEL=gemini-2.5-pro \
        ANTHROPIC_SMALL_FAST_MODEL=gemini-2.5-flash \
        /opt/homebrew/bin/claude $argv
end

function claude-gpt5 --description 'Launch Claude Code with OpenAI GPT 5 models'
    env \
        ANTHROPIC_BASE_URL=http://127.0.0.1:8317 \
        ANTHROPIC_AUTH_TOKEN=openai \
        ANTHROPIC_MODEL=gpt-5 \
        ANTHROPIC_SMALL_FAST_MODEL=gpt-5-minimal \
        /opt/homebrew/bin/claude $argv
end

function claude-gpt5-codex --description 'Launch Claude Code with OpenAI GPT 5 Codex models'
    env \
        ANTHROPIC_BASE_URL=http://127.0.0.1:8317 \
        ANTHROPIC_AUTH_TOKEN=openai \
        ANTHROPIC_MODEL=gpt-5-codex \
        ANTHROPIC_SMALL_FAST_MODEL=gpt-5-codex-low \
        /opt/homebrew/bin/claude $argv
end

function claude-proxy --description 'Launch Claude Code with Claude models via proxy'
    env \
        ANTHROPIC_BASE_URL=http://127.0.0.1:8317 \
        ANTHROPIC_AUTH_TOKEN=anthropic \
        ANTHROPIC_MODEL=claude-sonnet-4-20250514 \
        ANTHROPIC_SMALL_FAST_MODEL=claude-3-5-haiku-20241022 \
        /opt/homebrew/bin/claude $argv
end
