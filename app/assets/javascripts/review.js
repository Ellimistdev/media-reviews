class Review {
  constructor(review) {
    this.id = review.id;
    this.content = review.content;
    this.rating = review.rating;
    this.medium_title = review.medium.title;
    this.medium_id = review.medium.id
  }

  markup() {
    return `<div class='review-${this.id}'>         
      <h4 class='medium-title'>
        <a class='medium-link' href='/media/${this.medium_id}'>${this.medium_title}</a>, - <span class='review-rating'>${this.rating}/5</span>
      </h4>
      <p class='review-content'>${this.content}</p>
    </div>
    <hr>`
  }
}