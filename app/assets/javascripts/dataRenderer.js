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
    this.clearChildrenOf(document.getElementById('data'));
    const target = document.getElementById('title');
    const medium = new Medium(data);
    target.innerHTML += medium.title;
    if (medium.parent) {
      this.renderParent(medium.parent);
    }
    
    if (medium.children && medium.children.length > 1) {
        this.renderChildren(medium.children);
    }

    if (data.reviews.length < 1) {      
      const element = document.getElementsByClassName('title')[0].innerHTML;
      this.renderNoData(target, element, 'reviews');
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