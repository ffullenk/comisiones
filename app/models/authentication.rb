class Authentication < ActiveRecord::Base
  attr_accessible :provider, :token, :uid, :vendedor_id
  belongs_to :vendedor
end
