class User < ApplicationRecord
  before_save { self.email = email.downcase! } # перевод емайл в нижний регистр перед сохранением в базу данных
  validates :name,  presence: true, length: { maximum: 50 } #валидация наличия имени и его длинны не более 50

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },  uniqueness: { case_sensitive: false }
  # валидация наличия емайл и его длины не более 255 и соответстия требованиям емайла и              уникальности   чувствительности к регистру
end
