def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year FROM books WhERE books.series_id = (SELECT MIN(id) FROM series)"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters ORDER BY LENGTH(motto) DESC LIMIT 1"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, count(species) FROM characters GROUP BY species ORDER BY COUNT(species) DESC LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT DISTINCT authors.name AS author, subgenres.name AS subgenre FROM authors JOIN series ON authors.id = series.author_id JOIN subgenres ON series.subgenre_id = subgenres.id"
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM series JOIN authors ON series.author_id = authors.id JOIN characters ON authors.id = characters.author_id WHERE characters.species = 'human' GROUP BY series.title ORDER BY COUNT(characters.species) DESC LIMIT 1"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name AS name, COUNT(*) FROM characters JOIN character_books ON characters.id = character_books.character_id GROUP BY characters.name ORDER BY COUNT(characters.name) DESC"
end
