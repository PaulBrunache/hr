department_list = ["Row Labels","FDN","Foundation","Executive","FINANCE","HR","IT","MEA","Grant","Kramer Senior Service Agy","MGC","ADMINISTRATIVE SERVICES
","ADMISSIONS","CULN/NUTRITION SVCS","FACILITIES MANAGEMENT","FISCAL","HOUSEKEEPING","INSTITUTE","MARKET DEVELOPMENT
","MEDICAL SERVICES","MEMORY CARE","None Specified","NURSING SERVICES","PURCHASING","REHAB SERVICES","SOCIAL SERVICES
","THERAPEUTIC RECREATION","THRIFT SHOP","MHC","Administration","Culinary Services","HOUSEKEEPING","Maintenance
","Marketing","Medical Office","NURSING SERVICES","Resident Services","MHH","Adult Day Care","HomeCare- Medicare
","Kramer Senior Service Agy","MorseLifeHomeCare-Private","PACE"]
department_list.each do |department|
  Department.create!( name: department)
end
