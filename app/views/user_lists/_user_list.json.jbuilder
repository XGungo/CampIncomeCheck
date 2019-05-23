json.extract! user_list, :id, :channel_id, :name, :dual_score, :created_at, :updated_at
json.url user_list_url(user_list, format: :json)
