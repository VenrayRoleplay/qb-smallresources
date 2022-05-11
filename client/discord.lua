-- To Set This Up visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686

CreateThread(function()
    while true do
        -- This is the Application ID (Replace this with you own)
        SetDiscordAppId(965644520857432065)

        -- Here you will have to put the image name for the "large" icon.
        SetDiscordRichPresenceAsset('venray_rp')
        
        -- (11-11-2018) New Natives:

        -- Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('De beste stad van nederland!')
       
        -- Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('venray_rp')

        -- Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('Nogsteeds de beste stad van nederland maar dan kleiner')

        QBCore.Functions.TriggerCallback('smallresources:server:GetCurrentPlayers', function(result)
            SetRichPresence('Spelers: '..result..'/32')
        end)

        -- (26-02-2021) New Native:

        --[[ 
            Here you can add buttons that will display in your Discord Status,
            First paramater is the button index (0 or 1), second is the title and 
            last is the url (this has to start with "fivem://connect/" or "https://") 
        ]]--
        SetDiscordRichPresenceAction(0, "Join de discord!", "https://discord.gg/CS9PX48UNu")
        SetDiscordRichPresenceAction(1, "Of speel gezellig mee!", "https://servers.fivem.net/servers/detail/v4kook")

        -- It updates every minute just in case.
	Wait(60000)
    end
end)
