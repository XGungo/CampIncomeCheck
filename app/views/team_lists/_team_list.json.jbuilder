json.extract! team_list, :id, :team_id, :team_name, :score, :created_at, :updated_at
json.url team_list_url(team_list, format: :json)
