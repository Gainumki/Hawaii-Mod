return {
SMODS.Joker{
    key = 'tokenofappreciation', 
    loc_txt = { 
        name = 'Token of Appreciation',
        text = {
          "Sell this card to",
          "create a free",
          "{C:attention}#1#",
          "{C:inactive,s:0.8}A gift from a friend :3"
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
    pos = {x = 2, y = 1}, 
    config = { 
      extra = {
        tag = "tag_juggle"
      }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {localize{type = 'name_text', set = 'Tag', key = card.ability.extra.tag}}}
    end,

    calculate = function(self, card, context)
    if context.selling_self then
              add_tag(Tag(card.ability.extra.tag))
              play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
              play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
              return {
                  card = card,
                  message = 'Friendship!',
                  colour = G.C.ATTENTION
              }
    end
  end
}
}
