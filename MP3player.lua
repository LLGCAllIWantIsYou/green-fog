--game:GetService("SoundService").Environment = Enum.Environment.Bathroom
local function getGitSoundId(GithubSoundPath: string, AssetName: string): Sound
    local Url = GithubSoundPath

    if not isfile(AssetName..".mp3") then 
        writefile(AssetName..".mp3", game:HttpGet(Url)) 
    end

    local Sound = Instance.new("Sound")
    Sound.SoundId = getcustomasset(AssetName..".mp3", true)
    return Sound 
end

local CustomMusic = getGitSoundId("https://github.com/LLGCAllIWantIsYou/green-fog/blob/main/Rebzyyx%E3%80%81hoshie%20star%20-%20all%20I%20want%20is%20you%20(feat.%20hoshie%20star%EF%BD%9CExplicit).mp3?raw=true", "All I Want Is You")--url(raw) and file name
CustomMusic.Parent = game.Workspace
CustomMusic.Looped = true
CustomMusic.Volume = 1
CustomMusic.Pitch = 1
CustomMusic.PlaybackSpeed = 1
CustomMusic:Play()
