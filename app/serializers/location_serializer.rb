class LocationSerializer < ActiveModel::Serializer
	def id
    object.id.to_s
  end
 def fanscnt
  	object.users.size
 end

  attributes :id, :name, :max_cap, :current_state, :yelp_url, :site_url, :fanscnt
  # has_many :userlocationfavs, embed: :ids
  # has_many :doors
  # has_many :user_location_favs
  # has_many :users
end
