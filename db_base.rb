# TODO Change into active reecord
require 'sqlite3'

class DBBase
  def initialize
    @db = SQLite3::Database.new('dbfile')
    @db.results_as_hash = true
  end

  def drop_tables
    puts 'Dropping pronouns table...'
    @db.execute %q{
      Drop table pronouns
    }
  end

  def create_tables
    create_pronouns_table
  end

  def get_nominative
    return @db.execute %q{
    Select description,nominative from pronouns
    }
  end
  def get_all
    return @db.execute %q{
    Select * from pronouns
    }
  end

  private

  def create_pronouns_table
    puts 'Creating pronouns table...'
    @db.execute %q{
    Create table pronouns (
      id integer primary key,
      description varchar(50),
      nominative varchar(10),
      accusative varchar(10),
      dative varchar(10))
    }

    i = 0
    sql =  "Insert into pronouns(id,description,nominative,accusative,dative) values("
    puts 'Inserting pronouns...'
    @db.execute"#{sql}#{i += 1},'I','ich','mich','mir')"
    @db.execute"#{sql}#{i += 1},'you (informal)','du','dich','dir')"
    @db.execute"#{sql}#{i += 1},'he','er','ihn','ihm')"
    @db.execute"#{sql}#{i += 1},'she','sie','sie','ihr')"
    @db.execute"#{sql}#{i += 1},'it','es','es','ihm')"
    @db.execute"#{sql}#{i += 1},'we','wir','uns','uns')"
    @db.execute"#{sql}#{i += 1},'you (all)','ihr','euch','euch')"
    @db.execute"#{sql}#{i += 1},'they','sie','sie','ihnen')"
    @db.execute"#{sql}#{i += 1},'you (formal)','Sie','Sie','Ihnen')"
  end

end

# TODO Add the following in a rake task
#mydb = DBBase.new
#mydb.drop_tables
#mydb.create_tables