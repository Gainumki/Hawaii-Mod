return {
SMODS.Joker{
    key = 'hawaii', 
    loc_txt = { 
        name = 'Hawaii Pt. II ',
        text = {
          'This Joker gains {X:mult,C:white} X#1# {} Mult',
          "if discarded hand contains", 
          'a {C:attention}Full House{}',
          "{C:inactive} (Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
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
        if context.joker_main and card.ability.extra.Xmult > 1 then
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
}
