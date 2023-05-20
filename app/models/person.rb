class Person < ApplicationRecord
  enum :gender_type, %i[masculine feminine], scopes: true

  validates :name, presence: true, length: { minimum: 10, maximum: 30 }
  validates :age, presence: true, numericality: { greater_than: 0 }
  validates :cpf, presence: true, length: { is: 11 }, uniqueness: true
  validates :gender_type, inclusion: { in: Person.gender_types.keys }

  def gender_type=(value)
    self.class.gender_types.has_key?(value) ? super : nil
    # gender_type = self.class.gender_types.has_value?(value) ? value.to_i : nil
    # puts "Chegou o valor #{value} | gender_types: #{self.class.gender_types}"
  end
end