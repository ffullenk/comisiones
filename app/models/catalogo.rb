class Catalogo < ActiveRecord::Base
  attr_accessible :vendedor, :producto

  belongs_to :vendedor
  belongs_to :producto

  paginates_per 50
end
