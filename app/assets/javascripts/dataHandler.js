class DataHandler {
  setData(data, type) {
    // if data has a reviews collection, it is a single medium
    if (data.reviews){   
      DataRenderer.prototype.renderMediumData(data);
    } else if (type === 'index'){      
      DataRenderer.prototype.renderMediaIndex(data)
    } else {
      // otherwise it is a collection of reviews or views
      DataRenderer.prototype.renderUserData(data, type);
    }
  }
  
  getDataAsJson(route) {
    return fetch(route)
      .then(response => response.json());
  }
  
  renderData(route, type) {
    this.getDataAsJson(route)
      .then(json => this.setData(json, type));
  }
}
