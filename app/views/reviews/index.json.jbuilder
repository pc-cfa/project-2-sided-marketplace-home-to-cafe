json.array!(@reviews) do |review|
  json.extract! review, :id, :reviewee_id, :reviewer_id, :review, :rating
  json.url review_url(review, format: :json)
end
