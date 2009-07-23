class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true

  def full_address
    return "#{street_1}\n#{street_2}\n#{city}, #{state} #{zip}"
  end
end
