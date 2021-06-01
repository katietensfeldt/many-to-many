class RelationshipSerializer < ActiveModel::Serializer
  attributes :id, :follower_id, :leader_id

  # Something I will need to ask about later
  # How to get the serializers to work for this

end
