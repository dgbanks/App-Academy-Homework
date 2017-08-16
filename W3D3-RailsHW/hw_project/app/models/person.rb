class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :house_id, presence: true

  belongs_to :house, {
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :House
  }
  # THIS METHOD DOES THE SAME THING
  # def house
  #   House.find(self.house_id)
  # end
end
