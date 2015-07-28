class Contact
	
	attr_accessor :prenom, :nom, :adresse, :telephone, :email
	
	def initialize
		@prenom = prenom
		@nom = nom
		@adresse = adresse
		@email = email
		@telephone = telephone
	end
	
	def fiche_complete
		puts @nom + " " + @prenom
		puts "   " + @adresse
		puts "   " + "Tel : " + @telephone + " / Email : " + @email
	end
	
	def ajoute_carnet
	end
end

class Menu
	def initialize
		puts "\n-------------------------------------------------------"
		puts "Bienvenue dans le Carnet d'Adresse"
		puts "0- Consulter la liste des contact"
		puts "1- Ajouter un contact"
		puts "2- Supprimer un contact"
		puts "3- Quitter le carnet d'adresse"
		puts "Choisissez 0, 1, 2 ou 3"		
	end

end

########################################################################
#Contacts déjà enregistrés
########################################################################

#Contact n°1
donald = Contact.new
donald.prenom = "Donald"
donald.nom = "Duck"
donald.adresse = "66 rue de Disneyland, 75000 Disneyland"
donald.telephone = "06.06.06.06.06"
donald.email = "donald@email.com"

#Contact n°2
mickey = Contact.new
mickey.prenom = "Mickey"
mickey.nom = "Mouse"
mickey.adresse = "14 rue de la niaiserie, 68592 Disneyworld"
mickey.telephone = "07.07.07.07.07"
mickey.email = "mickey@email.com"

#Contact n°3
minnie = Contact.new
minnie.prenom = "Minnie"
minnie.nom = "La-Garce"
minnie.adresse = "34 route de la Garenne, 13000 Marseille"
minnie.telephone = "01.01.01.01.01"
minnie.email = "minnie@email.com"

#Tableau des contacts déjà enregistrés
mes_contacts = [donald, mickey, minnie]

#Cartes "sorties" de la boucle loop
sortie = 3
reponse_sortie = "non"

#Boucle qui nous renvoie au sommaire du carnet d'adresse
loop do

	#Initialisation du Menu
	Menu.new	
	#Récupération du choix utilisateur dans le menu
	choix = gets.chomp.to_i
		
		#Choix 0, consulter la liste des contacts
		if choix == 0
			i = 0#Compteur liste contact
			puts "\nVotre liste actuelle de contact est :"
			puts "======================================"
			mes_contacts.each do |a|
				puts "\n#{i}/"
				puts "#{a.fiche_complete}"
				i += 1
			end
			puts "\n\nVoulez-vous retourner à l'accueil (oui) ou quitter (non) ?"
			#N'importe quelle réponse nous renvoit dans la boucle
			#Seul "non" nous fais sortir.
			reponse = gets.chomp.to_s	
		
		#Choix 1, ajouter un contact
		elsif choix == 1
			puts "\nVous allez ajouter un nouveau contact :"		
			puts "======================================="
			#Initialisation d'un nouveau contact	
			nouveau_contact = Contact.new
			
			#Récupération et ajouts dans chaques variables 
			puts "\nEntrez le prénom"
			nouveau_contact.prenom = gets.chomp.capitalize
			puts "\nEntrez le nom"
			nouveau_contact.nom = gets.chomp.capitalize
			puts "\nEntrez l'adresse"
			nouveau_contact.adresse = gets.chomp
			puts "\nEntrez le téléphone"
			nouveau_contact.telephone = gets.chomp
			puts "\nEntrez l'email"
			nouveau_contact.email = gets.chomp

			#Ajout du nouveau contact dans le tableau mes_contacts
			mes_contacts << nouveau_contact
			
			puts "\nVotre contact a été ajouté !!!"
			puts "\nVoulez-vous retourner à l'accueil (oui) ou quitter (non) ?"
			#N'importe quelle réponse nous renvoit dans la boucle
			#Seul "non" nous fais sortir.
			reponse = gets.chomp.to_s
		
		#Choix 2, supprimer un contact
		elsif choix == 2
			i = 0#Compteur liste contact
			puts "\nVotre liste actuelle de contact est :"
			puts "======================================"
			mes_contacts.each do |a|
				puts "\n#{i}/"
				puts "#{a.fiche_complete}"
				i += 1
			end

			puts "Sélectionnez un contact à supprimer (N° + Entrée):"
			a_supprimer = gets.chomp.to_i
			mes_contacts.delete_at(a_supprimer)

			puts "\nVotre contact a été supprimé !!!"
			puts "\n\nVotre nouvelle liste de contact est :"
			puts "====================================="
			i = 0
			mes_contacts.each do |a|
				puts "\n#{i}/"
				puts "#{a.fiche_complete}"
				i += 1
			end

			puts "\nVoulez-vous retourner à l'accueil (oui) ou quitter (non) ?"
			reponse = gets.chomp.to_s
		
		#Quitte le carnet d'adresse
		else
		puts "\nMerci d'avoir utilisé le Carnet d'adresse"
		puts "\nA bientôt !!!\n"
		end

#Les cartes "sortie de prison"
break if choix == sortie
break if reponse == reponse_sortie 
end
