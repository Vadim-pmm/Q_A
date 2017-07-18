require 'csv'

if File.exist?('export.csv')
  CSV.foreach('export.csv', col_sep: ';', headers: true) do |row|
    Question.create(question: row['Question'],
                    answer:   row['Answer'],
                    lang:     row['Language'],
                    category: row['Category'])
  end
  puts 'Successfully seeded'
else
  puts 'No source found (export.csv)'
end
