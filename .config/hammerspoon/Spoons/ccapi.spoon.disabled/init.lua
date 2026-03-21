local obj = {}
obj.__index = obj

obj.name = "ccapi"
obj.version = "1.0"
obj.author = "naokiiida"
obj.license = "MIT"
obj.homepage = ""

obj.logger = hs.logger.new('ccapi')
obj.task = nil

function obj:init()
    self.logger.i("Initializing ccapi spoon")
    return self
end

function obj:start()
    if self:isRunning() then
        self.logger.w("ccapi is already running")
        return self
    end
    
    self.logger.i("Starting ccapi")
    
    self.task = hs.task.new("/usr/bin/env", function(exitCode, stdOut, stdErr)
        if exitCode ~= 0 then
            self.logger.e("ccapi failed with exit code: " .. exitCode)
            if stdErr and stdErr ~= "" then
                self.logger.e("stderr: " .. stdErr)
            end
        else
            self.logger.i("ccapi completed successfully")
        end
        self.task = nil
    end, {"bash", "-c", "cd /Users/naokiiida/basic-memory && RUST_LOG=info /Users/naokiiida/.local/share/cargo/bin/ccapi"})
    
    if self.task:start() then
        self.logger.i("ccapi task started successfully")
    else
        self.logger.e("Failed to start ccapi task")
        self.task = nil
    end
    
    return self
end

function obj:stop()
    if not self:isRunning() then
        self.logger.w("ccapi is not running")
        return self
    end
    
    self.logger.i("Stopping ccapi")
    self.task:terminate()
    self.task = nil
    return self
end

function obj:restart()
    self:stop()
    hs.timer.doAfter(1, function() self:start() end)
    return self
end

function obj:isRunning()
    return self.task ~= nil and self.task:isRunning()
end

function obj:bindHotkeys(mapping)
    local def = {
        start = function() self:start() end,
        stop = function() self:stop() end,
        restart = function() self:restart() end
    }
    hs.spoons.bindHotkeysToSpec(def, mapping)
    return self
end

return obj