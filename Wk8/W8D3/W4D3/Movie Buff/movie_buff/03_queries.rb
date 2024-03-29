def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.

  #Movie.select(:title, :id).joins(:actors).group('movies.id').having('actors.name = (?)', those_actors)
end

def golden_age
  # Find the decade with the highest average movie score.
  # Movie
  #   .select('(movies.yr / 10 ) * 10 AS decades')
  #   .group('((movies.yr / 10 )* 10)')
  #   .limit(1)
    # .pluck(:id)


    Movie
      .group('decade')
      .having('AVG(movies.score) > 0')
      .order('AVG(movies.score) DESC')
      .limit(1)
      .pluck('((movies.yr / 10) * 10) as decade')
      .first
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery


  Actor
    .joins(:castings)
    .where('castings.movie_id IN 
        (
        SELECT 
          movies.id
        FROM
          movies
        JOIN 
         castings ON castings.movie_id = movies.id
        JOIN
         actors ON castings.actor_id = actors.id 
        WHERE 
         actors.name = (?)
    ) AND actors.name != (?)', name, name)
    .pluck('DISTINCT actors.name')
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie

  Actor
    .select('count(actors.*)')
    .join(:castings)
    .where('actors.id NOT IN castings.actor_id')


#  SELECT 
#    COUNT(*) 
#  FROM
#     actors 
#   WHERE 
#    id NOT IN (
#      SELECT
#       actor_id 
#     FROM 
#       castings 
#    )

  # SELECT COUNT(actors.id)
  # FROM actors
  # RIGHT OUTER JOIN castings on castings.actor_id = actors.id
  

  # Group.includes(:user_group_cmb).where(user_group_cmbs: { user_id: 1 })

  # Group.left_outer_joins(:user_group_cmb)
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"






  Movie
  .select(:title)
  .joins(:actors)
  .where('actors.name LIKE (?)', whazzername)

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end
