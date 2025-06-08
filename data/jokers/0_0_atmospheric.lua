return {
SMODS.Joker{
    key = 'atmospheric', 
    loc_txt = { 
        name = 'Atmospheric Joker',
        text = {
          'Retriggers the {C:attention}first three{}',
          'scored {C:attention}5s{} twice'
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
    pos = {x = 2, y = 0}, 
    config = { 
      extra = {
        retriggers = 2,
        three = 0
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
    if context.before then
        card.ability.extra.three = 0
    end

    if context.cardarea == G.play and context.repetition and not context.repetition_only then
      if context.other_card:get_id() == 5 and card.ability.extra.three < 3 then
        card.ability.extra.three = card.ability.extra.three + 1
        return {
          message = 'Again!',
          message_card = context.blueprint_card or card,
          repetitions = card.ability.extra.retriggers,
          card = context.other_card
        }
      end
    end
  end
}
}
