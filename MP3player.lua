--​KEEPING SMILING = "All I Want Is You"
local function getGitSoundId(GithubSoundPath: string, AssetName: string): Sound
    local Url = GithubSoundPath

    if not isfile(AssetName..".mp3") then 
        writefile(AssetName..".mp3", game:HttpGet(Url)) 
    end

    local Sound = Instance.new("Sound")
    Sound.SoundId = getcustomasset(AssetName..".mp3", true)
    return Sound 
end

local C = getGitSoundId("https://github.com/Cosmella-v/Models/raw/main/video0-1-3.mp3", "All I Want Is You")--url(raw) and file name
C.Parent = game.Workspace
C.Looped = false
C.Volume = 1
C:Play()
