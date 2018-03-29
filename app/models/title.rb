class Title < ActiveRecord::Base
    has_many :figures, through: :figuretitles
end