return {
SMODS.Joker{
    key = 'precious', 
    loc_txt = { 
        name = 'Precious Joker',
        text = {
          "This joker gains {X:mult,C:white} #1#X {} Mult", 
          "each time a {C:attention}5{} is scored.", 
          "Resets after each round.",
          "{C:inactive} (Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
        },
    },
    atlas = 'Jokers', 
    rarity = 2, 
    cost = 5,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true, 
    eternal_compat = true, 
    perishable_compat = false, 
    pos = {x = 3, y = 0}, 
    config = { 
      extra = {
        Xmult = 1,
        Xmult_gain = 0.25
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.Xmult_gain, card.ability.extra.Xmult}}
    end,

    calculate = function(self, card, context)
    if context.end_of_round and context.main_eval and card.ability.extra.Xmult > 1 then
        card.ability.extra.Xmult = 1
        return {
          message = 'Reset!',
          message_card = card,
          repetitions = card.ability.extra.retriggers,
          card = context.other_card
        }

    end

    if context.joker_main and card.ability.extra.Xmult > 1 then
        return {
            Xmult_mod = card.ability.extra.Xmult,
            message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
            card = card
          }
    end
    
    if context.cardarea == G.play and context.individual and not context.blueprint then
      if context.other_card:get_id() == 5 then
        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain 
        return {
          message = 'Upgraded!',
          message_card = card,
          repetitions = card.ability.extra.retriggers,
          card = context.other_card
        }
      end
    end
  end
}
}
