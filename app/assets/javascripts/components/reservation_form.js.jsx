var ReservationForm = React.createClass({
  handleSubmit: function(e) {
    e.preventDefault();
    $.ajax({
      url: 'admin/reservations',
      dataType: 'json',
      type: 'POST',
      data: {reservation: this.state},
      success: function(data) {
        alert("You have successfully completed reservation.")
        console.log(data);
        this.setState({first_name: '', last_name: '', email: '', phone_number: '', city: '', res_date: '', time: '', vehicle_info: '', special_need: ''});
      }.bind(this),
      error: function(xhr, status, err) {
        //this.setState({data: comments});
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
    console.log(this.state);
  },
  
  handleFirstNameChange: function(e) {
    this.setState({first_name: e.target.value});
  },

  handleLastNameChange: function(e) {
    this.setState({last_name: e.target.value});
  },

  handlePhoneNumberChange: function(e) {
    this.setState({phone_number: e.target.value});
  },
  handleEmailChange: function(e) {
    this.setState({email: e.target.value});
  },
  handleCityChange: function(e) {
    this.setState({city: e.target.value});
  },
  handleResDateChange: function(e) {
    this.setState({res_date: e.target.value});
  },
  handleTimeChange: function(e) {
    this.setState({time: e.target.value});
  },
  handleSpecialNeedChange: function(e) {
    this.setState({special_need: e.target.value});
  },
  handleVehicleInfoChange: function(e) {
    this.setState({vehicle_info: e.target.value});
  },

  getInitialState: function() {
    return {first_name: '', last_name: '', email: '', phone_number: '', city: '', res_date: '', time: '', vehicle_info: '', special_need: ''};  
  },

  render: function() {
    return (          
      <div className="jumbotron">
        <div className="container">
          <h2> Reversation</h2>
          <form role="form" onSubmit={this.handleSubmit}>
            <div className="form-group">
              <label for="usr">First name:</label>
              <input type="text" className="form-control" id="first-name" required="true" value={this.state.first_name} onChange={this.handleFirstNameChange}/>
            </div>

            <div className="form-group">
              <label for="usr"> Last name:</label>
              <input type="text" className="form-control" id="last-name" required="true" value={this.state.last_name} onChange={this.handleLastNameChange}/>
            </div>


            <div className="form-group">
              <label for="usr"> Phone number:</label>
              <input type="text" className="form-control bfh-phone" data-format="+1 (ddd) ddd-dddd" id="phone-number" value={this.state.phone_number} onChange={this.handlePhoneNumberChange}/>
            </div>

            <div className="form-group">
              <label for="email"> Email:</label>
              <input type="email" className="form-control" id="email" required="true" value={this.state.email} onChange={this.handleEmailChange}/>
            </div>
            <div className="form-group">
            <label for="sel1">Select list:</label>
            <select className="form-control" id="city" value={this.state.city} onChange={this.handleCityChange}>
            <option>San Jose</option>
            <option>Milpitas</option>
            <option>Sunnyvale</option>
            <option>Mountain View</option>
            </select>
            </div>
            <div className="form-group">
              <label for="comment">Special need:</label>
              <textarea className="form-control" rows="5" id="special-need" value={this.state.special_need} onChange={this.handleSpecialNeedChange}></textarea>
            </div>

            <div className="form-group">
              <label for="comment">Vehicle info:</label>
              <textarea className="form-control" rows="5" id="vehicle-info" value={this.state.vehicle_info} onChange={this.handleVehicleInfoChange}></textarea>
            </div>
            <div className="form-group">
              <label for="date">Date: </label>
              <input type="date" className="form-control" id="date" required="true" value={this.state.res_date} onChange={this.handleResDateChange}></input>
            </div>
            <div className="form-group">
              <label for="time">Time:</label>
              <input type="time" className="form-control" id="time" required="true" value={this.state.time} onChange={this.handleTimeChange}></input>
            </div>
            <button type="submit" className="btn btn-default">Submit</button>
          </form>
        </div>
      </div>);
  }
});
