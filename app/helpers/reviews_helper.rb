module ReviewsHelper

  def company_review(company_id)
    reviews = Review.where(company_id: company_id)
    total = 0
    reviews.each do |r|
      total += r.rating
    end
    score = total/reviews.count
    if score == 0
      "No Reviews"
    else
      score
    end
  end

end