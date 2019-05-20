json.extract! admin_list, :id, :channel_id, :name, :created_at, :updated_at
json.url admin_list_url(admin_list, format: :json)
