class Review {
  constructor(review) {
    this.id = review.id;
    this.content = review.content;
    this.rating = review.rating;
    this.reviewer = review.reviewer;
    if (review.medium) {
      this.medium_title = review.medium.title;
      this.medium_id = review.medium.id;
    }    
  }

  markup() {
    return this.hasOwnProperty("medium_id") ? this.user_markup() : this.medium_markup();
  }
  
  user_markup() {
    return `<div class='review-${this.id}'>         
      <h4 class='title'>
        <a class='media-link' href='/media/${this.medium_id}'>${this.medium_title}</a>, - <span class='review-rating'>${this.rating}/5</span>
      </h4>
      <p class='review-content'>${this.content}</p>
    </div>
    <hr>`
  }

  medium_markup() {
    return `<div class='review-${this.id}'> 
      <p>${this.content} by <a class='reviewer-link' href='/users/${this.reviewer.id}'>${this.reviewer.username}</a></p>  
    </div>
    <hr>`
  }
}