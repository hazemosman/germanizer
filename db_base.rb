# TODO Change into active reecord
require 'sqlite3'

class DBBase
  def initialize
    @db = SQLite3::Database.new('dbfile')
    @db.results_as_hash = true
  end

  def drop_tables
    puts 'Dropping pronouns table...'
    @db.execute 'Drop table if exists pronouns'
    @db.execute 'Drop table if exists tenses'
    @db.execute 'Drop table if exists irr_verbs'
  end

  def create_tables
    create_pronouns_table
    create_tenses_table
    create_irr_verbs_table
  end

  def get_all_pronouns
    return @db.execute %q{
    Select * from pronouns
    }
  end

  def add_irr_veb
    # TODO implement functions
  end

# Private Methods
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

  def create_tenses_table
    puts 'Creating tenses table...'
    @db.execute %q{
    Create table tenses (
      id integer primary key,
      description varchar(10),
      tense varchar(10))
    }

    i = 0
    sql =  "Insert into tenses(id,description,tense) values("
    puts 'Inserting tenses...'
    @db.execute"#{sql}#{i += 1},'present','Präsens')"
    @db.execute"#{sql}#{i += 1},'preterite', 'Imperfekt, Präteritum')"
    @db.execute"#{sql}#{i += 1},'perfect','Perfekt')"
    @db.execute"#{sql}#{i += 1},'past perfect','Plusquamperfekt')"
    @db.execute"#{sql}#{i += 1},'future','Futur I')"
    @db.execute"#{sql}#{i += 1},'future perfect','Futur II')"
  end

  def create_irr_verbs_table
    puts 'Creating irr_verbs table...'
    @db.execute %q{
    Create table irr_verbs (
      id integer primary key,
      ich varchar(20),
      du varchar(20),
      er varchar(20),
      sie_she varchar(20),
      es varchar(20),
      wir varchar(20),
      ihr varchar(20),
      sie varchar(20),
      sie_formal varchar(20),
      tense_id)
    }
  end

end

# TODO Add the following in a rake task
mydb = DBBase.new
mydb.drop_tables
mydb.create_tables