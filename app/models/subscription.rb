class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer

  validates :title, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :frequency, presence: true
  validates :customer_id, presence: true
  validates :tea_id, presence: true 
end