class House < ActiveRecord::Base
  validates :address, presence: true

  has_many :people, {
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :Person
  }

  #THIS METHOD DOES THE SAME THING
  # def people
  #   Person.where(house_id: self.id)
  # end
end
