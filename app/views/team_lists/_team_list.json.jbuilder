json.extract! team_list, :id, :channel_id, :team_id, :team_name, :total_score, :created_at, :updated_at
json.url team_list_url(team_list, format: :json)
