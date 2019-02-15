class View {
  constructor(view) {
    this.id = view.id;
    this.medium_title = view.title;
    this.medium_id = view.medium_id
    this.created_at = view.created_at
  }

  markup() {
    return `<div class='view-${this.id}'>         
      <h4 class='medium-title'><a class='medium-link' href='/media/${this.medium_id}'>${this.medium_title}</a></h4>        
      <p class='view-content'>Viewed on: ${this.created_at}</p>
    </div>
    <hr>`
  }
}