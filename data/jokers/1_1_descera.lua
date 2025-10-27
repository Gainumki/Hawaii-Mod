return {
 SMODS.Joker {
    key = 'descera',
    loc_txt = {
      name = 'Descera',
      text = {
        "this Joker gains {X:mult,C:white} X#2# {} Mult",
        "before final {C:attention}hand{} of round",
        "{C:inactive}(Currently {X:mult,C:white} X#1# {} {C:inactive}Mult)"
      }
    },
    -- Extra is empty, because it only happens once. If you wanted to copy multiple cards, you'd need to restructure the code and add a for loop or something.
    config = { extra = {Xmult = 1, Xmult_gain = 1} },
    rarity = 4,
    atlas = 'Jokers',
    pos = { x = 0, y = 1 },
    soul_pos = {x = 1, y = 1},
    
      unlocked = true, 
      discovered = false, --whether or not it starts discovered
      blueprint_compat = true, --can it be blueprinted/brainstormed/other
      eternal_compat = true, --can it be eternal
      perishable_compat = true, --can it be perishable
      cost = 20,
      loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_gain } }
      end,
      
      calculate = function(self, card, context)
    if context.before and not context.blueprint and G.GAME.current_round.hands_left == 0 then
          card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
          return {
              card = card,
              message = 'Upgraded!'
          }
    end

      if context.joker_main and card.ability.extra.Xmult > 1 then
        return {
          Xmult_mod = card.ability.extra.Xmult,
          message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
          card = card      
        }
      end
    end

  },

  }