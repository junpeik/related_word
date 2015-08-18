class Word < ActiveRecord::Base
  has_one :synonym, dependent: :destroy
end
