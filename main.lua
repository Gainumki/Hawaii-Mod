--- STEAMODDED HEADER
--- MOD_NAME: Hawaii Pt. II
--- MOD_ID: HAWAII_OMEGA
--- MOD_AUTHOR: [garb, Omegaflowey18]
--- MOD_DESCRIPTION: Jokers for Omega :3
--- PREFIX: hawa
----------------------------------------------
------------MOD CODE -------------------------

local mod = SMODS.current_mod
hawa_config = mod.config

local function garb_batch_load(txt) 
    local joker_files = NFS.getDirectoryItems(mod.path.."data/"..txt)
    sendInfoMessage(mod.path.."data/"..txt)
    local txt = txt..'/'
    for _, file in pairs(joker_files) do
        sendInfoMessage(file)
        if string.find(file, ".lua") then
          assert(SMODS.load_file("data/"..txt..file))()
        end
    end
    sendInfoMessage("FINISHED BATCH LOAD FOR "..txt)
    return true
end

config = SMODS.current_mod.config

SMODS.Atlas({
	key = "modicon",
	path = "icon.png",
	px = 32,
	py = 32,
})

SMODS.Atlas{
    key = 'Jokers',
    path = 'Jokers.png', 
    px = 71, 
    py = 95 
}

SMODS.Sound {
    key = "music_hawaii",
    path = {
        ["default"] = "music_hawaii.ogg"
    },
    sync = false,
    pitch = 1,
    select_music_track = function()
      return next(SMODS.find_card("j_hawa_hawaii")) and 20 and config.music or false
    end
}


SMODS.current_mod.config_tab = function()
    garb_nodes = {{n=G.UIT.R, config={align = "cm"}, nodes={
      {n=G.UIT.O, config={object = DynaText({string = "Options:", colours = {G.C.WHITE}, shadow = true, scale = 0.4})}},
    }},create_toggle({label = "Hawai Pt. II Music", ref_table = config, ref_value = "music",
    })
  }
    return {
      n = G.UIT.ROOT,
      config = {
          emboss = 0.05,
          minh = 6,
          r = 0.1,
          minw = 10,
          align = "cm",
          padding = 0.2,
          colour = G.C.BLACK
      },
      nodes = garb_nodes
    }  
  end
  
garb_batch_load("jokers")

  
----------------------------------------------
------------MOD CODE END----------------------
    
