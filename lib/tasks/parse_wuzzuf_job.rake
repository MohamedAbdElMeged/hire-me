require 'csv'
task :parse_wuzzuf_job => [:environment] do
    table = CSV.parse(File.read("Wuzzuf_Jobs.csv"), headers: true)
    i = 1
    job_activity_status = [true,false]
    table.each do |tuple|
        job = Job.new
        job.location = Location.find_or_create_by(name: tuple['Location'])
        job.country = Country.find_or_create_by(name: tuple['Country'])
        job.company = Company.find_or_create_by(name: tuple['Company'])
        job.job_type = tuple['Type']
        job.level = tuple['Level']
        job.title = tuple['Title']
        job.years_of_exp = tuple['YearsExp']
        job.recruiter_id = User.find_by_email("admin@admin.com")
        job.is_active = job_activity_status.sample
        skills_names = tuple['Skills'].split(',').map
        skills_names.each do |skill_name|
            job.skills << Skill.find_or_create_by(name: skill_name)
        end
        job.save!
        p i
        i+=1
    end
    
end