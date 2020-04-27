# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Journal.create(name: "PubMed", website: "https://www.ncbi.nlm.nih.gov/pubmed/", open_source: false)
Journal.create(name: "PLOS", website: "https://www.ncbi.nlm.nih.gov/pubmed/", open_source: true)
Journal.create(name: "Nature", website: "https://www.nature.com/", open_source: false)
Journal.create(name: "Pathology", website: "https://www.journals.elsevier.com/pathology", open_source: true)

User.create(email: "demo@email.com", password: "#{SecureRandom.hex(12)}")