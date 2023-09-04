
--- Config ---
notWhitelistedMessage = "Non sei nel discord: https://discord.gg/XkgHBujUyz" -- Messaggio che appare quando verifica che non sei nel discord
whitelistRoles = { -- ID ruolo del discord
    "1131500116780535808",
    
    
}

--- Codice ---

AddEventHandler("playerConnecting", function(name, setCallback, deferrals)
    local src = source
    local passAuth = false
    deferrals.defer()
    deferrals.update("Verificando se sei nel server discord...")

    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
        end
    end

    if identifierDiscord then
        usersRoles = exports.discord_perms:GetRoles(src)
        local function has_value(table, val)
            if table then
                for index, value in ipairs(table) do
                    if value == val then
                        return true
                    end
                end
            end
            return false
        end
        for index, valueReq in ipairs(whitelistRoles) do 
            if has_value(usersRoles, valueReq) then
                passAuth = true
            end
            if next(whitelistRoles,index) == nil then
                if passAuth == true then
                    deferrals.done()
                else
                    deferrals.done(notWhitelistedMessage)
                end
            end
        end
    else
        deferrals.done("Discord non rilevato.")
    end
end)



░██████╗██╗██╗░░░░░███████╗██████╗░██╗  ░█████╗░██████╗░██╗░██████╗░██╗███╗░░██╗░█████╗░██╗░░░░░
██╔════╝██║██║░░░░░██╔════╝██╔══██╗██║  ██╔══██╗██╔══██╗██║██╔════╝░██║████╗░██║██╔══██╗██║░░░░░
╚█████╗░██║██║░░░░░█████╗░░██████╔╝██║  ██║░░██║██████╔╝██║██║░░██╗░██║██╔██╗██║███████║██║░░░░░
░╚═══██╗██║██║░░░░░██╔══╝░░██╔══██╗██║  ██║░░██║██╔══██╗██║██║░░╚██╗██║██║╚████║██╔══██║██║░░░░░
██████╔╝██║███████╗███████╗██║░░██║██║  ╚█████╔╝██║░░██║██║╚██████╔╝██║██║░╚███║██║░░██║███████╗
╚═════╝░╚═╝╚══════╝╚══════╝╚═╝░░╚═╝╚═╝  ░╚════╝░╚═╝░░╚═╝╚═╝░╚═════╝░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝╚══════╝


