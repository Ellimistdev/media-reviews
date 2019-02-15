class Medium {
  constructor(medium) {
    this.id = medium.id;
    this.title = medium.title;
    this.children = medium.children;
    this.reviews = medium.reviews;
    this.parent = medium.parent;
  }

  markup() {
    return `<div class='medium-${this.id}'>         
      <h4 class='title'>${this.title}</h4>  
      <section id='reviews'></section>
      <section id='children'></section>
      <section id='parent'></section>      
      <span id='no-data'></span>
    </div>`
  }
}