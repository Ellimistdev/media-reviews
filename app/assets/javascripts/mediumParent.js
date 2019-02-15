class MediumParent {
  constructor(parent) {
    this.id = parent.id;
    this.medium_id = parent.medium_id;
    this.title = parent.title;
  }

  markup() {
    return `<div id='medium-parent-${this.id}'>  
      <hr>
      <p>A member of <a class='media-link' href='/media/${this.medium_id}'>${this.title}</a></p>
      <hr>
    </div>`
  }
}