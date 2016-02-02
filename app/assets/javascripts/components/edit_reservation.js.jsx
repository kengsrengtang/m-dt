var EditReservation = React.createClass({
  componentDidMount(){
    $(this.getDOMNode()).modal('show');
    $(this.getDOMNode()).on('hidden.bs.modal', this.props.handleHideModal);
  },
  propTypes:{
                handleHideModal: React.PropTypes.func.isRequired
              },
  formatTime: function(time){
    var date = new Date(time);
    hour = date.getHours();
    minute = date.getMinutes();
    if(hour.toString().length == 1){
      hour = "0" + hour
    }
    return hour + ":" + minute
  },

  handleSave: function(){
    var s = this.state;
    this.props.handleSave({id: s.id, comment: s.comment, res_date: s.res_date, time: s.time, status: 1});
  },

  handleCommentChange: function(e){
    this.setState({comment: e.target.value});
  },
  
  getInitialState: function(){
    return(this.props.reservation);
  },

  render: function(){
    return (
      <div className="modal fade">
        <div className="modal-dialog">
          <div className="modal-content">
            <div className="modal-header">
              <button type="button" className="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 className="modal-title">{this.props.title}</h4>
            </div>
            <div className="modal-body">
              <div className="container">
                <h2> Reversation</h2>
                <form role="form">
                  <div className="form-group">
                    <h6>Name: {this.state.first_name + " " +  this.state.last_name} </h6>
                    <h6>Phone Number: {this.state.phone_number}</h6>
                    <h6>Email: {this.state.email}</h6>
                    <h6>City: {this.state.city}</h6>
                    <h6>Detail Option: {this.state.selected_detail_option.name}</h6>
                    <h6>Vehicle Size: {this.state.selected_vehicle_size.name}</h6>
                    <h6>Additonal Services: 
                      
                    </h6>
                    <h6>Price: {this.state.city}</h6>
                  </div>                  

                  <div className="form-group">
                    <label for="comment">Comment:</label>
                    <textarea className="form-control" rows="5" id="comment" defaultValue={this.state.comment} onChange={this.handleCommentChange}></textarea>
                  </div>
                  <div className="form-group">
                    <label for="date">Date: </label>
                    <input type="date" className="form-control" id="date" required="true" defaultValue={new Date(this.state.res_date).toISOString().split('T')[0]}></input>
                  </div>
                  <div className="form-group">
                    <label for="time">Time:</label>
                    <input type="time" className="form-control" id="time" required="true" defaultValue={this.formatTime(this.state.time)}></input>
                  </div>
                </form>
              </div>
            </div>
          <div className="modal-footer">
          <button type="button" className="btn btn-default" data-dismiss="modal">Close</button>
          <button type="button" className="btn btn-primary" onClick={this.handleSave}>Save changes</button>
        </div>
      </div>
    </div>
  </div>);           
  }
})
