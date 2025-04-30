--- STEAMODDED HEADER
--- MOD_NAME: Hawaii Pt. II
--- MOD_ID: HAWAII_OMEGA
--- MOD_AUTHOR: [garb]
--- MOD_DESCRIPTION: Hawaii Pt. II Legendary Joker made for Omega
--- PREFIX: hawa
----------------------------------------------
------------MOD CODE -------------------------

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

SMODS.Joker{
    key = 'hawaii', 
    loc_txt = { 
        name = 'Hawaii Pt. II ',
        text = {
          'This Joker gains {X:mult,C:white} X#1# {} Mult',
          "if discarded hand contains", 
          'a {C:attention}Full House{}',
          "{C:inactive} (Currently {X:mult,C:white} X#2# {} Mult)"
        },
    },
    atlas = 'Jokers', 
    rarity = 4, 
    soul_pos = { x = 1, y = 0 },
    cost = 20,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true, 
    eternal_compat = true, 
    perishable_compat = false, 
    pos = {x = 0, y = 0}, 
    config = { 
      extra = {
        Xmult_gain = 1,
        Xmult = 1
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.Xmult_gain, card.ability.extra.Xmult}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                Xmult_mod = card.ability.extra.Xmult,
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
                card = card
              }
        end

        if context.pre_discard and not context.blueprint then
            local text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
            if text == "Full House" or text == "Flush House" then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
                return { message = localize("k_upgrade_ex") }
            end
        end
    end
}


  
----------------------------------------------
------------MOD CODE END----------------------
    
