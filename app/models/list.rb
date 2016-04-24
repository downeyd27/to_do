class List < ActiveRecord::Base
  has_many :tasks
  validates :name, presence: true, length: { maximum: 50 }
  before_save :downcase

private

  def downcase
    self.name = name.downcase()
  end
end
