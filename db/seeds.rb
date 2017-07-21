require 'json'

if File.exist?('export.json')
  total_counter = err_counter = 0
  JSON.load(File.open('export.json')).each do |row|
    q = Question.create(question: row['question'],
                        answer:   row['answer'],
                        lang:     row['lang'],
                        category: row['category'])
    total_counter += 1
    if q.errors.count != 0
      puts q.errors.full_messages
      puts q.question
      puts '--------------------'
      err_counter += 1
    end
  end
  puts 'Seeded : ' + (total_counter - err_counter).to_s + ' of ' + total_counter.to_s
else
  puts 'No source found (export.json)'
end
