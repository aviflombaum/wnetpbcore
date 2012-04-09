class EssenceTrackIdentifierSource < ActiveRecord::Base
  include Picklist
  has_many :essence_tracks
  quick_column :name
  
  def safe_to_delete?
    # This throws an AR exception; Essence Tracks do not belong
    # to Essence Tracker Identifier Sources.
    #
    #essence_tracks.size == 0
    true
  end
end
