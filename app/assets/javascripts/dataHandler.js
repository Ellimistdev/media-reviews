class DataHandler {
  clear(target) {
    target.innerHTML = '';
  }

  setData(data, target, type) {
    if (data.length < 1) {      
      const username = document.getElementById('username').innerHTML;
      target.innerHTML = `${username} has no ${type}s!`;
    } else {
      this.clear(target);
      data.forEach(element => {
        let obj = type === 'review' ? new Review(element) : new View(element);
        target.innerHTML += obj.markup();
      });
    }
  }
  
  getDataAsJson(route) {
    return fetch(route)
      .then(response => response.json());
  }
  
  renderData(route, target, type) {
    this.getDataAsJson(route)
      .then(json => this.setData(json, target, type));
  }
}