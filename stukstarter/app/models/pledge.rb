# == Schema Information
#
# Table name: pledges
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  reward_id       :integer
#  amount          :integer
#  shipping        :decimal(, )
#  expiration_date :date
#  uuid            :string
#  name            :string
#  address         :string
#  city            :string
#  country         :string
#  postal_code     :string
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_pledges_on_reward_id  (reward_id)
#  index_pledges_on_user_id    (user_id)
#

class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :reward

  before_validation     :generate_uuid!, :on => :create
  validates_presence_of :name, :address, :city, :country, :postal_code, :amount, :user_id

  private

  def generate_uuid!
    begin
      self.uuid = SecureRandom.hex(16)      
    end while Pledge.find_by(:uuid => self.uuid).present?
  end

end
