class Person < ApplicationRecord
  validates :name, presence: true, length: { minimum: 10, maximum: 30 }
  validates :age, presence: true, numericality: { greater_than: 0 }
  validates :cpf, presence: true, length: { is: 11 }, uniqueness: true
end
