local userid_to_entindex = client.userid_to_entindex
local get_local_player = entity.get_local_player
local is_enemy = entity.is_enemy
local console_cmd = client.exec
local ui_get = ui.get
local trashtalk = ui.new_checkbox("MISC", "Miscellaneous", "Trashtalk")

local table = {
    "That was a big one on my screen.",
    "Your poorness pisses me off.",
    "One.",
    "Go on using cracked cheats.",
    "Missed due to crack",
    "Fucking junkie kid.",
    "UID?",
    "NN",
    "Playing with free cheat again today?",
    "Unemployed scooter rider.",
    "Retard",
    "More levelheaded than your father.",
    "Your father begs for milk.",
    "Already got a job?",
    "Stay Skeetless.",
    "What do you use? Ah yes, free cheats.",
    "Go refound, oh thats right free cheat.",
    "Enjoy VACation!",
    "Do you have a mental impairment?",
    "1 you Nobody.",
    "Single-celled kid.",
    "When RQ?",
    "AHAHAHAHAHHAHA 1.",
    "Meanwhile, very amusing.",
    "Cringelord",
    "ez",
    "Quiet you high school dropout.",
    "Can you tell your diary first how bad you are in HVH.",
    "Thanks for the laugh kick, your existence is very amusing."
}

local function get_table_length(data)
    if type(data) ~= "table" then
        return 0
    end
    local count = 0
    for _ in pairs(data) do
        count = count + 1
    end
    return count
end

local num_quotes = get_table_length(table)

local function on_player_death(e)
    if not ui_get(trashtalk) then
        return
    end

    local victim_userid, attacker_userid = e.userid, e.attacker

    if victim_userid == nil or attacker_userid == nil then
        return
    end

    local victim_entindex = userid_to_entindex(victim_userid)
    local attacker_entindex = userid_to_entindex(attacker_userid)

    if attacker_entindex == get_local_player() and is_enemy(victim_entindex) then
        local exec_command = "say " .. table[math.random(num_quotes)]
        console_cmd(exec_command)
    end
end

client.set_event_callback("player_death", on_player_death)
