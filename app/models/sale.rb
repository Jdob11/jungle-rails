class Sale < ApplicationRecord
  validates :starts_on, :ends_on, presence: true
  validate :dates_are_valid

  def dates_are_valid
    errors.add(:starts_on, 'must be a valid date') unless starts_on.is_a?(Date)
    errors.add(:ends_on, 'must be a valid date') unless ends_on.is_a?(Date)
  end
  
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end
end
