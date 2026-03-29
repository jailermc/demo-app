class Estimated < ActiveRecord::Base
  has_one :cost_sheet
  has_many :rfis

  def self.search(search)

      where('address LIKE ?', "%#{search}%")

  end
end
