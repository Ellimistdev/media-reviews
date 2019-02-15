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

  submitData(route, form, form_field) {
    let notice = document.getElementById('notice');
    DataRenderer.prototype.clear(notice);    
    fetch(route, {
      method: 'post',
      body: form,
    })
    .then(response => {
      if (response.status === 201) {
        response.json().then(json => DataRenderer.prototype.appendReview(json));          
        form_field.reset();
      } else {
        response.json().then(messages => {          
          messages['errors'].forEach(error => {
            notice.innerHTML += `<li class='error'>${error}</li>`;        
          });
        });
      }
      form_field.lastElementChild.removeAttribute('disabled');
    });
  }

  setUser(json) {
    return new User(json);
  }

  getCurretUser() {
    return this.getDataAsJson('/cui').then(json => this.setUser(json));
  }
}
