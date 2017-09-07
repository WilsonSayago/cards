json.extract! card, :id, :number, :cvv, :expirate_date, :created_at, :updated_at
json.url card_url(card, format: :json)