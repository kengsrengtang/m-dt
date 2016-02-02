var MainReservation = React.createClass({
  handleHideModal(){
    this.setState({view: {showModal: false}})
  },
  
  handleShowModal(reservation){
    this.setState({selectedReservation: reservation})
    this.setState({view: {showModal: true}})
  },

  handleSave(editedReservation){
    $.ajax({
      url: 'admin/reservations',
      type: 'PUT',
      dataType: 'json',
      cache: false,
      data: {reservation: editedReservation},
      success: function(data){
        tmpData = this.state.data;

        var BreakException= {};
        try {
          tmpData.forEach(function(re, index){
            if(re.id === data.id){
              tmpData.splice(index,1);
              //tmpData[index] = data;
              throw BreakException;
            }
          });

        } catch(e) {
          if (e!==BreakException) throw e;
        }
        this.setState({data: tmpData});
        alert("Reservation has successfully approved.")
      }.bind(this),
      error: function(data){
        if(data.status === 401){
          window.location='#'; 
        }
      }.bind(this)
    });

    console.log(editedReservation);            
  },

  handleDelete(reservation){
    var index = this.state.data.indexOf(reservation);
    data = this.state.data;
    data.splice(index, 1);
    this.setState({data: data});
  },

  render: function(){
    return (
      <div className="jumbotron">
        <div className="container">
          <h2> Reversations List</h2>
          <ReservationList data={this.state.data} handleShowModal={this.handleShowModal} handleDelete={this.handleDelete} handleApprove={this.handleSave} status={this.state.status}  />
          {this.state.view.showModal ? <EditReservation title={"Edit Reservation"} reservation={this.state.selectedReservation} handleSave={this.handleSave}  handleHideModal={this.handleHideModal} /> : null}
        </div>
      </div>
    );
  },
  
  getInitialState(){
    return {view: {showModal: false}, selectedReservation: null, data: [], status: this.props.status || 0}
  },

  componentDidMount: function(){
    this.fetchReservations();
  },

  fetchReservations: function(){
    $.ajax({
      url: 'admin/reservations?status=' + this.state.status,
      dataType: 'json',
      cache: false,
      success: function(data){
        this.setState({data: data});
      }.bind(this),
      error: function(data){
        if(data.status === 401){
          window.location='#'; 
        }
      }.bind(this)
    });
  }
})
