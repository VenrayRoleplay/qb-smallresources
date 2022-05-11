local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = '',
    ['testwebhook'] = '',
    ['playermoney'] = '',
    ['playerinventory'] = '',
    ['robbing'] = '',
    ['cuffing'] = '',
    ['drop'] = '',
    ['trunk'] = '',
    ['stash'] = '',
    ['glovebox'] = '',
    ['banking'] = 'https://discord.com/api/webhooks/968163895808253963/P2YDAUcf3wODI2iCmBdUs8a-gOPvUPSA7yi-5zocB9HMPFo8gFpMAiGekxV3GUOhg860',
    ['vehicleshop'] = '',
    ['vehicleupgrades'] = '',
    ['shops'] = '',
    ['dealers'] = '',
    ['storerobbery'] = 'https://discord.com/api/webhooks/968151805898915911/7EyQvOQnlOxrLOeDhuWd2kW0N3487aiAEvxRBwD-h0EU0GOsRlthzIV-NikrurkuLu8c',
    ['bankrobbery'] = '',
    ['powerplants'] = '',
    ['death'] = '',
    ['joinleave'] = '',
    ['ooc'] = '',
    ['report'] = 'https://discord.com/api/webhooks/968152225878782002/bqsYhDBBVNLeWM4xKsKZFQWxQanWYxUxkk3P5YWPuJw2CKvBHKcuHmfh9GqSsF1gUUvK',
    ['me'] = '',
    ['pmelding'] = '',
    ['112'] = '',
    ['bans'] = '',
    ['anticheat'] = 'https://discord.com/api/webhooks/968152041623027772/lW2yk5j_reeBpVzNoj_e20IN3clXpOGCOu1E4jZ2kfkMqJfyyd_uac2F3GJAryN6vD95',
    ['weather'] = '',
    ['moneysafes'] = '',
    ['bennys'] = 'https://discord.com/api/webhooks/968163794343850044/tnz31aTjPzYSUwKeuM-OwcjGbUByatHaioVfub1LFGiDHkKIBSQ6uJfK98L_ImBJ9iuu',
    ['bossmenu'] = '',
    ['robbery'] = '',
    ['casino'] = '',
    ['traphouse'] = '',
    ['911'] = '',
    ['palert'] = '',
    ['house'] = '',
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)        
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'Venray logs',
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/938084763636477972/965922511000846346/LogoVenray.png',
            },
        }
    }
    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'Venray logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'Venray logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function(source, args)
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
