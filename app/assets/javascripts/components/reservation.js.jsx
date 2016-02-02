var Reservation = React.createClass({
  handleEdit: function(){
    this.props.handleReply(this.props.reservation);
  },

  handleDelete: function(){
    this.props.handleDelete(this.props.reservation);             
  },
 
  handleApprove: function(){
    this.props.handleApprove(this.props.reservation);
  },

  renderButtons: function(){
    if(this.props.status === 0){
      return(
        <td width="170px">
          <button type="button" className="btn btn-primary btn-xs" onClick={this.handleEdit}>Reply</button>
          &nbsp;
          <button type="button" className="btn btn-success btn-xs" onClick={this.handleApprove}>Approve</button>
          &nbsp;
          <button type="button" className="btn btn-danger btn-xs" onClick={this.handleDelete}>Delete</button>
        </td>
        );
    }else{
      return(
      <td width="60px">
        <button type="button" className="btn btn-danger btn-xs" onClick={this.handleDelete}>Delete</button>
      </td>
      );
    }
  },

  render: function(){
    return(
      <tr>
        <td>{this.props.reservation.first_name} &nbsp; {this.props.reservation.last_name}</td>
        <td>{this.props.reservation.email}</td>
        <td>{this.props.reservation.phone}</td>
        <td>{this.props.reservation.city}</td>
        <td>{this.props.reservation.country}</td>
        <td>{this.props.reservation.res_date}</td>
        <td>{this.props.reservation.time}</td>
        {this.renderButtons()}
      </tr>
    );
  }
});
