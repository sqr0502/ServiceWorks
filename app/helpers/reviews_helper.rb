module ReviewsHelper

  # Collect all of a company's reviews and return an average rating.
  def company_review(company_id)
    reviews = Review.where(company_id: company_id)
    total = 0

    reviews.each do |r|
      total += r.rating
    end

    # return an average rating accurate to 2 decimal places
    if total == 0
      "No Reviews"
    else
      (total.to_f/reviews.count).round(2)
    end
  end

end
