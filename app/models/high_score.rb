class HighScore < Neo4j::Rails::Model
  property :game, :type => String
  property :score, :type => Fixnum

end
