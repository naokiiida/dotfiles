local obj = {}
obj.__index = obj

-- Metadata
obj.name = "YtDlp"
obj.version = "1.0"
obj.author = "Naoki Iida"
obj.homepage = "https://github.com/Hammerspoon/hammerspoon"
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.timer = nil

function obj:init()
    return self
end

function obj:start()
    -- Schedule to run every Wednesday at 0:00
    self.timer = hs.timer.doEvery(60, function()
        local currentTime = os.date("*t")
        -- Check if it's Wednesday (wday 4) at 0:00
        if currentTime.wday == 4 and currentTime.hour == 0 and currentTime.min == 0 then
            self:runYtDlp()
        end
    end)
    return self
end

function obj:stop()
    if self.timer then
        self.timer:stop()
        self.timer = nil
    end
    return self
end

function obj:runYtDlp()
    local url = "https://abema.tv/video/title/87-2011"
    local command = string.format('yt-dlp "%s"', url)

    hs.task.new("/bin/bash", function(exitCode, stdOut, stdErr)
        if exitCode == 0 then
            hs.notify.new({
                title = "yt-dlp",
                informativeText = "Download completed successfully"
            }):send()
        else
            hs.notify.new({
                title = "yt-dlp",
                informativeText = "Download failed: " .. (stdErr or "Unknown error")
            }):send()
        end
    end, {"-c", command}):start()
end

return obj