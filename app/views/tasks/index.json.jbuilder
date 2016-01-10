json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :token, :period, :user
  json.url task_url(task, format: :json)
end
