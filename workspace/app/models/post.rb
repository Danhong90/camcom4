class Post < ActiveRecord::Base
    has_many :posthashrels
    has_many :postuserrels
    default_scope {order('post_deadline ASC')}

end
