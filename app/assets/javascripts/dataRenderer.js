class DataRenderer { 
  clearChildrenOf(target) {
    Array.from(target.children).forEach(child => child.innerHTML = '');
  }
 
  renderReviews(reviews) {
    let target = document.getElementById('reviews');
    target.innerHTML += "<h4>Reviews:</h4><ul id='reviews-list'></ul>";
    target = document.getElementById('reviews-list');
    reviews.forEach(element => {
      let obj = new Review(element);
      target.innerHTML += obj.markup();        
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
    const target = document.getElementById('title')
    const medium = new Medium(data);
    target.innerHTML += medium.title;

    if (data.reviews.length < 1) {      
      const medium = document.getElementsByClassName('title')[0].innerHTML;
      this.renderNoData(target, medium, 'reviews');
    } else {
      this.renderReviews(medium.reviews);
    }

    // if (data.children.length > 1) {
    //   this.renderChildren();
    // }

    // if (data.parent) {
    //   this.renderParent();
    // }
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
}