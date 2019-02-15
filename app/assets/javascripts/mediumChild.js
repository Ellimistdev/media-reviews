class MediumChild {
  constructor(child) {
    this.id = child.id;
    this.medium_id = child.medium_id;
    this.title = child.title;    
  }

  markup() {
    return `<div class='child-${this.id}'>         
      <a class='media-link' href='/media/${this.medium_id}'>${this.title}</a>      
    </div>`
  }
}