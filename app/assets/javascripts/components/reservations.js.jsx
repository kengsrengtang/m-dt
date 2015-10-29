var Reservations = React.createClass({
  render: function() {
    return (          
      <div className="jumbotron">
        <div className="container">
          <h2> Reversation</h2>
          <form role="form">
            <div className="form-group">
              <label for="usr">First name:</label>
              <input type="text" className="form-control" id="first-name" required="true"/>
            </div>

            <div className="form-group">
              <label for="usr"> Last name:</label>
              <input type="text" className="form-control" id="last-name" required="true"/>
            </div>


            <div className="form-group">
              <label for="usr"> Phone number:</label>
              <input type="text" className="form-control bfh-phone" data-format="+1 (ddd) ddd-dddd" id="phone-number"/>
            </div>

            <div className="form-group">
              <label for="email"> Email:</label>
              <input type="email" className="form-control" id="email" required="true"/>
            </div>
            <div className="form-group">
            <label for="sel1">Select list:</label>
            <select className="form-control" id="city">
            <option>San Jose</option>
            <option>Milpitas</option>
            <option>Sunnyvale</option>
            <option>Mountain View</option>
            </select>
            </div>
            <div className="form-group">
              <label for="comment">Special need:</label>
              <textarea className="form-control" rows="5" id="special-need"></textarea>
            </div>

            <div className="form-group">
              <label for="comment">Vehicle info:</label>
              <textarea className="form-control" rows="5" id="vehicle-info"></textarea>
            </div>
            <div className="form-group">
              <label for="date">Date: </label>
              <input type="date" className="form-control" id="date" required="true"></input>
            </div>
            <div className="form-group">
              <label for="time">Time:</label>
              <input type="time" className="form-control" id="time" required="true"></input>
            </div>
            <div className="checkbox">
              <label><input type="checkbox"> </input>Remember me</label>
            </div>
            <button type="submit" className="btn btn-default">Submit</button>
          </form>
        </div>
      </div>);
  }
});
