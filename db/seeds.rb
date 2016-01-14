# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
services = ['Hand wash and dry', 'Utilizing Clay Technology', 'Clean Door Jambs', 'Clean windows Inside & Out', 'Clean Rims and Shine Tires', 'Vacuum full interior',
      'Vaccum Turnk', 'Dashboard wipe-down', 'Anti-Static Showroom Conditoiner -premium wax', 'Hand wax vehicle', 'Shampoo interior carpets, mats, & seats',
      'Full interior cleaning doors panel and vents, cup holders, visors, etc', 'Full headliner cleaning', 'Pre-treat all carpet & upholstery stains',
      'Clean leather vinyl & plastics', 'Condition Leather Vinyl & Plastics','Shine exterior']
service_1, service_2, service_3, service_4, service_5, service_6, service_7, service_8, service_9, service_10, service_11, service_12, service_13, service_14, service_15, service_16, service_0 = nil
services.each_with_index do |service, i|
  eval("service_#{i} = Service.find_or_create_by name: service")
end

detail_options = ['wash & vaccum', 'wash & spary wax', 'wash & hand wax', 'mini interior cleaning', 'interior detail', 'exterior detail', 'complete detail']
detail_option_0, detail_option_1, detail_option_2, detail_option_3, detail_option_4, detail_option_5, detail_option_6, detail_option_7 = nil
detail_options.each_with_index do |d_option, i|
  eval("detail_option_#{i} = DetailOption.find_or_create_by name: d_option")
  services = []
  case i
  when 0
    service = []
    [0,2,3,4,5,6,7].each do |s|
      services.push eval("service_#{s}")
    end
    #eval("detail_option_#{i}").services = services
  when 1
    services = []
    [0,2,3,4,5,6,7,8].each do |s|
      services.push eval("service_#{s}")
    end
  when 2
    services = []
    [0,2,3,4,5,6,7,8,9].each do |s|
      services.push eval("service_#{s}")
    end
  when 3
    services = []
    [5,6,7,10,13,14].each do |s|
      services.push eval("service_#{s}")
    end
  when 4
    services = []
    [5,6,7,10,11,12,13,14,15].each do |s|
      services.push eval("service_#{s}")
    end
  when 5
    services = []
    [0,1,2,3,4,5,6,7,8,9,16].each do |s|
      services.push eval("service_#{s}")
    end
  when 6
    services = []
    (0..16).each do |s|
      services.push eval("service_#{s}")
    end
  end
  eval("detail_option_#{i}").services = services
end

vehicle_sizes = ['2 Doors + 1 Row Seat(coupe/compact)', '2/4 Doors + 2 Rows Seat(stand size)', 'Hatchback', 'Small SUV, Truck or Van(2 rows seat)', 'Mid Size SUV, Truck or Mini Van(3 rows seat)', 'Full Size SUV, Truck or VAN(3 rows seat)']
vehicle_size_0, vehicle_size_1, vehicle_size_2, vehicle_size_3, vehicle_size_4, vehicle_size_5, vehicle_size6 = nil
vehicle_sizes.each_with_index do |vs, i|
  eval("vehicle_size_#{i} = VehicleSize.find_or_create_by name: vs ")
  case i
  when 0
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_0, price: 25 
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_1, price: 45 
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_2, price: 65 
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_3, price: 40 
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_4, price: 95 
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_5, price: 95 
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_6, price: 175

  when 1
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_0, price: 30 
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_1, price: 45
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_2, price: 65
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_3, price: 55
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_4, price: 110
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_5, price: 110
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_6, price: 200

  when 2
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_0, price: 35  
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_1, price: 55
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_2, price: 70
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_3, price: 75
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_4, price: 125
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_5, price: 125
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_6, price: 225

  when 3
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_0, price: 40  
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_1, price: 60
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_2, price: 75
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_3, price: 75
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_4, price: 135
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_5, price: 135
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_6, price: 250


  when 4
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_0, price: 45  
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_1, price: 65 
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_2, price: 85 
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_3, price: 95 
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_4, price: 160 
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_5, price: 160 
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_6, price: 300 

  when 5
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_0, price: 50  
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_1, price: 70
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_2, price: 95
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_3, price: 95
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_4, price: 175
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_5, price: 175
    Rate.find_or_create_by vehicle_size: eval("vehicle_size_#{i}"), detail_option: detail_option_6, price: 325
  end
end
additional_services = ['Vehicle Condition(Heavy Duty)', 'Dog Hair', 'Headlight Restoration', 'Chip & Scratch Repair(Starting price)', 'Windshield Chip & Crack Repair(1st)', 'Windshield Chip & Crack Repair(2and)']
as_1, as_2, as_3, as_4, as_5, as_6, as_0 =nil
additional_services.each_with_index do |as, i|
  eval("as_#{i} = AdditionalService.find_or_create_by name: as")
  case i
  when 0
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_0, price: 10 
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_2, price: 10
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_3, price: 10
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_4, price: 35
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_5, price: 55
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_6, price: 35
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_7, price: 55
  when 1
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_0, price: 10
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_2, price: 10
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_3, price: 10
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_4, price: 25
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_5, price: 25
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_6, price: 25
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_7, price: 25

  when 2
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_0, price: 50
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_2, price: 50
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_3, price: 50
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_4, price: 50
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_5, price: 50
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_6, price: 50
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_7, price: 50

  when 3
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_0, price: 75
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_2, price: 75
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_3, price: 75
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_4, price: 75
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_5, price: 75
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_6, price: 75
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_7, price: 75

  when 4
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_0, price: 65
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_2, price: 65
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_3, price: 65
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_4, price: 65
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_5, price: 65
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_6, price: 65
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_7, price: 65

  when 5
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_0, price: 35
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_2, price: 35
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_3, price: 35
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_4, price: 35
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_5, price: 35
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_6, price: 35
    AdditionalRate.find_or_create_by additional_service: eval("as_#{i}"), detail_option: detail_option_7, price: 35
  end
end

