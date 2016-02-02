var ReservationForm = React.createClass({
  componentDidMount: function(){
    this.getReservationSetting();
  },

  getReservationSetting: function(){
    $.ajax({
      url: 'admin/reservations/setting',
      dataType: 'json',
      method: 'get',
      success: function(data){
        ass = JSON.parse(data.additional_services).map(function(as){
          as["selected"] = false;
          return(as)
        });
        tmpDO = JSON.parse(data.detail_options)
        tmpVS = data.setting.vehicle_sizes
        tmpDO.unshift({name: ''});
        tmpVS.unshift({name: ''});
        this.setState({vehicle_sizes: tmpVS, additional_services:ass });
        this.setState({detail_options: tmpDO});
      }.bind(this),
      error: function(xhr, status, err){
      }.bind(this)
    })                     
  },

  handleSubmit: function(e) {
    e.preventDefault();
    var state = this.state;
    var ass = state.selected_ass.map(function(as){return({id: as.id, name: as.name});});

    data = {
      first_name: state.first_name,
      last_name: state.last_name,
      email: state.email,
      phone_number: state.phone_number,
      selected_vehicle_size: {id: state.selected_vehicle_size.id, name: state.selected_vehicle_size.name},
      selected_detail_option: {id: state.selected_detail_option.id, name: state.selected_detail_option.name},
      selected_additional_service: ass,
      res_date: state.res_date,
      time: state.time,
      city: state.city
    }
    $.ajax({
      url: 'admin/reservations',
      dataType: 'json',
      type: 'POST',
      data: {reservation: data},
      success: function(data) {
        alert("You have successfully completed reservation.")
        this.setState({first_name: '', last_name: '', email: '', phone_number: '', city: '', res_date: '', time: '', vehicle_info: '', special_need: ''});
      }.bind(this),
      error: function(xhr, status, err) {
        //this.setState({data: comments});
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },

  handleASChange: function(as, e) {
    var sdo =  this.state.selected_detail_option;
    var price = this.state.price;
    var tmpSelectedASS = this.state.selected_ass;

    var additional_services = this.state.additional_services.map(function(tmpAS){
      tmpAS.selected = (as.id === tmpAS.id ? !tmpAS.selected : tmpAS.selected);
      return tmpAS
    })
    for(var i in as.additional_rates){
      if(as.additional_rates[i].detail_option_id === sdo.id){
        var index = tmpSelectedASS.indexOf(as);
        if(as.selected){
          if(index < 0){
            tmpSelectedASS.push(as);
          }
        }else{
          if(index > -1){
            tmpSelectedASS.splice(index, 1);
          }
        }
        break;
      }
    }
    var ASPrice = this.calculateASPrice(tmpSelectedASS, sdo);
    price += (ASPrice - this.state.as_price);
    this.setState({selected_ass: tmpSelectedASS, additional_services: additional_services, price: price, as_price: ASPrice});
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

  handleDetailOptionChange: function(e){
    if(e.target.value === ""){
      this.setState({show_as: false, price: 0, detail_services: [], selected_detail_option: {id: '', name: ''}});
      return;
    }
    var tmp = this.state.detail_options;
    var tmpSelected; 
    for(var i in tmp){
      if(tmp[i].name == e.target.value){
        tmpSelected =  tmp[i];
        this.setState({detail_services: tmp[i].services, selected_detail_option: tmp[i]});
      }
    }
    vsId = this.state.selected_vehicle_size.id;
    dOption = tmpSelected;
    rates = dOption.rates;
    if(vsId != ''){
      for(var i in rates){
        if(rates[i].vehicle_size_id == vsId){
          var ASPrice = this.calculateASPrice(this.state.selected_ass, tmpSelected);
          this.setState({show_as: true, price: rates[i].price + ASPrice});
        }
      }
    }
  },

  handleVehicleSizeChange: function(e){
    if(e.target.value === ""){
      this.setState({show_as: false, price: 0, selected_vehicle_size: {name: '', id: ''}});
      return;
    }

    var tmp = this.state.vehicle_sizes;
    var tmpSelected;
    for(var i in tmp){
      if(tmp[i].name == e.target.value){
        tmpSelected = tmp[i];
        this.setState({selected_vehicle_size: tmp[i]});
      }
    }

    vsId = tmpSelected.id;
    dOption = this.state.selected_detail_option;
    rates = dOption.rates
    if(dOption.id != ''){
      for(var i in rates){
        if(rates[i].vehicle_size_id == vsId){
          var ASPrice = this.calculateASPrice();
          this.setState({price: rates[i].price + ASPrice, show_as: true});
        }
      }
    }
  },

  calculateASPrice: function(selected_ass = this.state.selected_ass, sdo = this.state.selected_detail_option){
    var price = 0;
    for(var i in selected_ass){
      for(var j in selected_ass[i].additional_rates){
        if(selected_ass[i].additional_rates[j].detail_option_id === sdo.id){
          price += selected_ass[i].additional_rates[j].price;
        }
      }
    }
    return price;
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
    return {
      additional_services:[], 
      detail_services: [], 
      vehicle_sizes: [], 
      detail_options: [], 
      first_name: '', 
      last_name: '', 
      email: '', 
      phone_number: '', 
      city: '', 
      res_date: '', 
      time: '', 
      vehicle_info: '', 
      special_need: '', 
      selected_detail_option: {id: '', name: ''}, 
      selected_vehicle_size: {id: '', name: ''},
      selected_ass:[],
      as_price: 0,
      show_as: false,
      price: 0};  
  },

  render: function() {
    return (          
      <div className="jumbotron">
        <div className="container">
          <h2> Reversation</h2>
          <form id="reservation" role="form" onSubmit={this.handleSubmit}>
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
            <select className="form-control" id="city" value={this.state.city} required onChange={this.handleCityChange}>
            <option value="">Please select</option>
            <option value="San Jose"> San Jose</option>
            <option value="Milpitas">Milpitas</option>
            <option value="Sunnyvale">Sunnyvale</option>
            <option vlaue="Mountain View">Mountain View</option>
            </select>
            </div>

            <div className="form-group">
              <label for="sel1">Select Vehicle Type:</label>
              <select className="form-control" id="vehicle-sizes" required value={this.state.selected_vehicle_size.name} onChange={this.handleVehicleSizeChange}>
              {
                this.state.vehicle_sizes.map(function(vs, i){
                  return <option value={vs.name}> {vs.name == '' ? "Please select." : vs.name}</option>
                })
              }
              </select>
            </div>

            <div className="form-group">
              <label for="sel1">Select Detail Option:</label>
              <select className="form-control" id="detail-optons" required value={this.state.selected_detail_option.name} onChange={this.handleDetailOptionChange}>
              {
                this.state.detail_options.map(function(vs, i){
                  return <option value={vs.name}>{vs.name == '' ? "Please select." : vs.name}</option>
                })
              }
              </select>
            </div>
         

            <div className="form-group">
              <ul className="list-group">
                {
                  this.state.detail_services.map(function(ds, i){
                    return <li className="list-group-item">{i + 1}. {ds.name}</li>
                  })
                }
              </ul>
            </div>


            <div className="form-group" style={{display: this.state.show_as ? 'block' : 'none'}}>
              <div clasNames="col-lg-6">
                {
                  this.state.additional_services.map(function(as,i){
                    return ( <div className="input-group">
                      <span className="input-group">
                        <input name="additional-services" type="checkbox" checked={as.selected} onChange={this.handleASChange.bind(this, as)}> { as.name}</input>
                      </span>
                    </div>)
                  }.bind(this))
                }
              </div>
            </div>

            <div className="form-group">
              <h2>${this.state.price}</h2>
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
