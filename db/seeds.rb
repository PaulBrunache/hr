department_list = ["Foundation","Executive","FINANCE","HR","IT","MEA","Grant","Kramer Senior Service Agy","MGC","ADMINISTRATIVE SERVICES
","ADMISSIONS","CULN/NUTRITION SVCS","FACILITIES MANAGEMENT","FISCAL","HOUSEKEEPING","INSTITUTE","MARKET DEVELOPMENT
","MEDICAL SERVICES","MEMORY CARE","None Specified","NURSING SERVICES","PURCHASING","REHAB SERVICES","SOCIAL SERVICES
","THERAPEUTIC RECREATION","THRIFT SHOP","MHC","Administration","Culinary Services","HOUSEKEEPING","Maintenance
","Marketing","Medical Office","NURSING SERVICES","Resident Services","MHH","Adult Day Care","HomeCare- Medicare
","Kramer Senior Service Agy","MorseLifeHomeCare-Private","PACE"]
department_list.each do |department|
  Department.create!( name: department)
end

job_list= [
  {title: "Assistant" ,
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."},
  {title: "Front Desk" ,
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."},
  {title: "Attendant" ,
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."}
]
job_list.collect do |job|
  JobPosting.create!( title: job[:title], description: job[:description])
end
