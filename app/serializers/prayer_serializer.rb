class PrayerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :entry_id, :user_id, :prayed, :created_at, :updated_at
end
