json.extract! run, :id, :date, :resting_pulse, :weight, :type, :pace, :heartrate, :duration, :distance, :weather, :remark, :created_at, :updated_at
json.url run_url(run, format: :json)