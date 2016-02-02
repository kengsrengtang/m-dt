var ReservationList = React.createClass({
  
  handleReply: function(reservation){
    this.props.handleShowModal(reservation);
  },

  handleDelete: function(reservation){
    $.ajax({
      url: 'admin/reservations',
      dataType: 'json',
      type: 'DELETE',
      data: {id: reservation.id},
      success: function(res){
        this.props.handleDelete(reservation);
      }.bind(this),
      error: function(res){
      }.bind(this)
    });
  },
  
  handleApprove: function(reservation){
    this.props.handleApprove({id: reservation.id, status: 1});
  },

  render: function(){
    var self = this;
    var reservationNode = this.props.data.map(function(re, index){
      return(<Reservation reservation={re} handleReply={self.handleReply} handleDelete={self.handleDelete} handleApprove={self.handleApprove} status={self.props.status}/>);
    });
    return(
      <table className="table table-hover">
        <thead>
          <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>City</th>
            <th>Company</th>
            <th>Res Date</th>
            <th>Res Time</th>
            <th>actions</th>
          </tr>
        </thead>
        <tbody>
        {reservationNode} 
        </tbody>
      </table>
    );         
  } 
});



