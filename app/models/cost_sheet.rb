class CostSheet < ActiveRecord::Base
  belongs_to :estimated
  has_many :dailylogs
  has_many :change_orders
  has_many :employees
  has_many :time_sheets

  def self.search(search)

    where('address LIKE ?', "%#{search}%")

  end


end
