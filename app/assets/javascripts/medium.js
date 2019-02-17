class Medium {
  constructor(medium) {
    this.id = medium.medium_id || medium.id;
    this.title = medium.title;
    this.children = medium.children;
    this.reviews = medium.reviews;
    this.parent = medium.parent;
  }
}