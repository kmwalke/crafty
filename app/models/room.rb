class Room < ApplicationRecord
  belongs_to :dungeon

  has_many :checks

  attr :passed_checks, :player

  def run(player)
    init(player)
    run_checks

    {
      room: self,
      result: result_text
    }
  end

  private

  def init(player)
    @player = player
    @passed_checks = false
  end

  def run_checks
    check.each do |check|
      @passed_checks ||= check.run(@player)
      bad_consequence unless @passed_checks
    end
  end

  def result_text
    return success_text if @passed_checks
    fail_text
  end

  def bad_consequence
    @player.update(vitality: @player.vitality - 20)
  end
end
