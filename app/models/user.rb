class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 } #валидация наличия имени и его длинны не более 50
  validates :email, presence: true, length: { maximum: 255 } # валидация наличия емайл и его длины не более 255
end
