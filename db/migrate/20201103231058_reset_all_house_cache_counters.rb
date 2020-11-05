class ResetAllHouseCacheCounters < ActiveRecord::Migration[6.0]
  def up
    House.find_each { |house| House.reset_counters(house.id, :clips_count) }
  end

  def down
  end
end
