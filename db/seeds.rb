
require 'open-uri'

verbatim1photo = URI.open('https://resize-europe1.lanmedia.fr/f/webp/r/622,311,forcex,center-middle/img/var/europe1/storage/images/europe1/medias-tele/cette-photo-de-coluche-a-ete-prise-aux-toilettes-935020/18757842-1-fre-FR/Cette-photo-de-Coluche-a-ete-prise-aux-toilettes.jpg')
verbatim2photo = URI.open('https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSVkcK6VNL4VjeccFcC-yid6BO5X_NzKmxKC6SWWgePR4bM3y3n47x1jS2lBMo3OtqaPfCSlzVpDXR6F68tl_6hiROLHLU-gQoRtlrwsA&usqp=CAc')
verbatim3photo = URI.open('https://resize-europe1.lanmedia.fr/f/webp/r/622,311,forcex,center-middle/img/var/europe1/storage/images/europe1/medias-tele/cette-photo-de-coluche-a-ete-prise-aux-toilettes-935020/18757842-1-fre-FR/Cette-photo-de-Coluche-a-ete-prise-aux-toilettes.jpg')
verbatim4photo = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNaBBm9ZPhtL9nbsTdfIlH6CpJ1T6-gqgIQA&usqp=CAU')
verbatim5photo = URI.open('https://www.gstatic.com/tv/thumb/persons/78891/78891_v9_ba.jpg')

banner1photo = URI.open('https://images.unsplash.com/photo-1508923567004-3a6b8004f3d7?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8bW91bnRhaW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
banner2photo = URI.open('https://images.unsplash.com/photo-1455729552865-3658a5d39692?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80')
banner3photo = URI.open('https://images.unsplash.com/photo-1502581827181-9cf3c3ee0106?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjR8fHNwYWNlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
banner4photo = URI.open('https://images.unsplash.com/photo-1537519646099-335112f03225?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8c3VyZnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')


puts "Cleaning database"
User.destroy_all
Counter.destroy_all
Verbatim.destroy_all
Banner.destroy_all

puts "Creating users:"
victor = User.create!(email: "victor@gmail.com", password: "123456")
pierre = User.create!(email: "pierre@gmail.com", password: "123456")
if (victor.save && victor.save)
  puts "User created"
else
  puts "Error"
end

puts "Creating counter: 50000 by default"
counter = Counter.create!(surface: '50000')
if counter.save
    puts "Counter created"
else
  puts "Error"
end

puts "Creating verbatims"
verbatim1 = Verbatim.create(published: true, author: "Coluche", citation:"Quand j'étais petit à la maison, le plus dur c'était la fin du mois... Surtout les trente derniers jours !")
verbatim2 = Verbatim.create(published: true, author: "Winston Churchill", citation:"Le meilleur argument contre la démocratie est un entretien de cinq minutes avec un électeur moyen.")
verbatim3 = Verbatim.create(published: true, author: "Encore Coluche", citation:"Il faut cueillir les cerises avec la queue. J'avais déjà du mal avec la main !")
verbatim4 = Verbatim.create(published: true, author: "Philippe Geluck", citation:"Boire du café empêche de dormir. Par contre, dormir empêche de boire du café.")
verbatim5 = Verbatim.create(published: true, author: "Fred Allen", citation:"Une star, c'est quelqu'un qui travaille dur pour être connu et qui, ensuite, porte des lunettes noires pour qu'on ne le reconnaisse pas.")

verbatim1.photo.attach(io: verbatim1photo, filename: 'verbatim1.jpeg', content_type: 'image/jpeg')
verbatim2.photo.attach(io: verbatim2photo, filename: 'verbatim2.jpeg', content_type: 'image/jpeg')
verbatim3.photo.attach(io: verbatim3photo, filename: 'verbatim3.jpeg', content_type: 'image/jpeg')
verbatim4.photo.attach(io: verbatim4photo, filename: 'verbatim4.jpeg', content_type: 'image/jpeg')
verbatim5.photo.attach(io: verbatim5photo, filename: 'verbatim5.jpeg', content_type: 'image/jpeg')

if (verbatim1 && verbatim2 && verbatim3 && verbatim4 && verbatim5 )
  puts "Verbatims created"
else
  puts "Error"
end

puts "Creating banners"

banner1 = Banner.create(published: true, title: "Banner 1")
banner2 = Banner.create(published: true, title: "Banner 2")
banner3 = Banner.create(published: true, title: "Banner 3")
banner4 = Banner.create(published: true, title: "Banner 4")

banner1.photo.attach(io: banner1photo, filename: 'banner1.jpeg', content_type: 'image/jpeg')
banner2.photo.attach(io: banner2photo, filename: 'banner2.jpeg', content_type: 'image/jpeg')
banner3.photo.attach(io: banner3photo, filename: 'banner3.jpeg', content_type: 'image/jpeg')
banner4.photo.attach(io: banner4photo, filename: 'banner4.jpeg', content_type: 'image/jpeg')


if (banner1 && banner2 && banner3 && banner4 )
  puts "Banners created"
else
  puts "Error"
end









puts "Seeding finished"
