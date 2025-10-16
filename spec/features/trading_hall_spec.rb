require 'rails_helper'

RSpec.describe 'TradingHall' do
  # Trading hall allows auction house like listings
  # Trading is async.
  # UX: You enter the trading hall. you peruse the listings and once catches your eye.
  #     A Rare vehicle!  It is a little expensive though.  They want 20x gold coins.
  #     You counter the offer at 15 gold pieces.
  #     The gold pieces are removed from your inventory.  The hall will keep them safe.
  #     Some time later, the player who listed the trade accepts.
  #     You are notified and the new item is ready for pickup at the hall.

  # UX: Same as above, but the price is right.  You accept the trade immediately.
  #     20x Gold Coins removed from your inventory.  Listing player is notified.
  #     Your new vehicle is ready for pickup at the hall right away

  # UX: Same as first, but after some time, the listing player declines the counter
  #     You are notified.  Your gold coins are ready for pickup at the hall

  # all these "notices" imply in game mail.  The flash notice is too ephemeral
  # probably in game email or something.  whew, fun
  pending 'building section of homepage'
  pending 'list a trade in the hall'
  pending 'counter a trade in the hall'
  pending 'accept a trade in the hall'
end
