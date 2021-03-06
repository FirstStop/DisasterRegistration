require 'httparty'
require 'json'

def print_token(person)
  pdf = Services::Token.generate_token_pdf(person, 'DC04')
  file = Tempfile.new('')
  file.puts(pdf.render.force_encoding('UTF-8'))
  file.close

  Services::Printers.print_token(file, "DC04", "Brother_QL_500")
end

desc 'loop continuously checking for new registrations to print'
task :print_loop, [:base_url] do |cmd, args|
  Bundler.require(:printing)

  last_known = File.open("last_known.txt").read

  while true do
    response = HTTParty.get("#{args[:base_url]}/stream/registrations.json?since=#{last_known}")
    persons = JSON.parse(response.body)
    persons.each do |person_json|
      person = Person.find(person_json["id"]) || Person.create(person_json)
      last_known = person_json["updated_at"]
      File.write("last_known.txt", last_known )
      puts "printing: #{person_json}"
      print_token person
    end
    sleep 1
  end
end