module ReviewsHelper

  def company_review(company_id)
    reviews = Review.where(company_id: company_id)
    total = 0
    reviews.each do |r|
      total += r.rating
    end
    total/reviews.count
  end
  
end
