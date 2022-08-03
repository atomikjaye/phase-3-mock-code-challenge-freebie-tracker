class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def recieved_one?(item_name)
    self.freebies.exists?(item_name: item_name)
  end

  def give_away(new_dev, freebie)
    freebie.dev_id = new_dev.id
    freebie.save
  end
end
