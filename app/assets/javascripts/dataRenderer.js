class DataRenderer {
  clear(target) {    
    target.innerHTML = '';
  }

  clearChildrenOf(target) {
    Array.from(target.children).forEach(child => this.clear(child));
  }
 
  renderParent(parent) {
    const target = document.getElementById('parent');
    target.innerHTML += '<h4>Parent:</h4>';
    let obj = new MediumParent(parent);
    target.innerHTML += obj.markup();            
  }

  renderChildren(children) {
    const target = document.getElementById('children');
    target.innerHTML += '<h4>Children:</h4>';
    children.forEach(child => {
      let obj = new MediumChild(child);
      target.innerHTML += obj.markup();        
    });
  }

  setReviewHeader() {
    let target = document.getElementById('reviews');
    this.clear(target);
    target.innerHTML += "<h4>Reviews:</h4><ul id='reviews-list'></ul>";
  }

  appendOwnerActions(target, id) {
    target.innerHTML += `<div class='current_user_actions_review_${id}'>
                          <a class='edit-review-link' href='/reviews/${id}/edit'>Edit Review</a>
                          <button class='delete-review' onclick='DataHandler.prototype.deleteReview(${id})'>Delete Review</button>
                        </div>`;
  }
  
  renderReviews(reviews) {
    this.setReviewHeader();
    let target = document.getElementById('reviews-list');
    DataHandler.prototype.getCurrentUser().then(user => {    
      reviews.forEach(element => {      
        let obj = new Review(element);
        target.innerHTML += obj.markup(); 
        if (user && obj.reviewer.id === user.id) {
          let review = document.getElementById(`review-${obj.id}`);
          this.appendOwnerActions(review, obj.id);
        }       
      });
    });
  }
  
  appendReview(json) {
    DataHandler.prototype.getCurrentUser().then(user => {     
      let target = document.getElementById('reviews-list');
      if (!target) {
        this.setReviewHeader();
        target = document.getElementById('reviews-list');
      }
      let obj = new Review(json);
      target.innerHTML += obj.mediumMarkup();
      if (user && obj.reviewer.id === user.id) {
        let review = document.getElementById(`review-${obj.id}`);
        this.appendOwnerActions(review, obj.id);
      }   
    });
  }
  
  renderViews(views) {        
    const target = document.getElementById('views');
    views.forEach(element => {
      let obj = new View(element);
      target.innerHTML += obj.markup();        
    });
  }
  
  renderNoData(target, element, type) {
    target.lastElementChild.innerHTML += `${element} has no ${type}!`;
  }

  renderMediumData(data) {   
    const dataElement = document.getElementById('data')
    this.clearChildrenOf(dataElement);
    const target = document.getElementById('title');
    const medium = new Medium(data);
    target.innerHTML += medium.title;
    if (medium.parent) {
      this.renderParent(medium.parent);
    }
    
    if (medium.children && medium.children.length > 0) {
        this.renderChildren(medium.children);
    }

    if (data.reviews.length < 1) {      
      this.renderNoData(dataElement, target.innerHTML, 'reviews');
    } else {
      this.renderReviews(medium.reviews);
    }

  }

  renderUserData(data, type) {
    const target = document.getElementById('user-data');    
    this.clearChildrenOf(target);
    if (data.length < 1) {      
      const username = document.getElementById('username').innerHTML;
      this.renderNoData(target, username, type);
    } else {
      type === 'reviews' ? this.renderReviews(data) : this.renderViews(data);
    }
  }

  renderMediaIndex(index) {
    const target = document.getElementById('media-list');
    this.clear(target);    

    index.forEach(medium => {
      let obj = new Medium(medium);
      target.innerHTML += `<li><a class='media-link' href='/media/${obj.id}'>${obj.title}</a></li>`;
    });
  }
}