# TODO Change into active record
require 'sqlite3'
require_relative 'verb'

class DBBase
  def initialize
    @db = SQLite3::Database.new('dbfile')
    @db.results_as_hash = true
  end

  def drop_tables
    puts 'Dropping pronouns table...'
    @db.execute 'Drop table if exists pronouns'
    @db.execute 'Drop table if exists tenses'
    @db.execute 'Drop table if exists verbs'
  end

  def create_tables
    create_pronouns_table
    create_tenses_table
    create_verbs_table
  end

  def get_pronouns
     @db.execute('Select * from pronouns')
  end

  def insert_veb(verb)
    @db.execute(%q{Insert into verbs(tense_id, infinitive, ich, du, er, sie_she, es, wir, ihr, sie, sie_formal)
      values(?,?,?,?,?,?,?,?,?,?,?)},
    verb.tense_id, verb.infinitive, verb.ich, verb.du, verb.er, verb.sie_she, verb.es, verb.wir, verb.ihr, verb.sie, verb.sie_formal)
  end

  def get_tenses
    return @db.execute %q{
    Select * from tenses
    }
  end

# Private Methods
  private

  def create_pronouns_table
    puts 'Creating pronouns table...'
    @db.execute %q{
    Create table pronouns (
      id integer primary key Autoincrement,
      description varchar(50),
      nominative varchar(10),
      accusative varchar(10),
      dative varchar(10)
      )
    }

    i = 0
    sql =  'Insert into pronouns(description,nominative,accusative,dative) values('
    puts 'Inserting pronouns...'
    @db.execute"#{sql}'I','ich','mich','mir')"
    @db.execute"#{sql}'you (informal)','du','dich','dir')"
    @db.execute"#{sql}'he','er','ihn','ihm')"
    @db.execute"#{sql}'she','sie','sie','ihr')"
    @db.execute"#{sql}'it','es','es','ihm')"
    @db.execute"#{sql}'we','wir','uns','uns')"
    @db.execute"#{sql}'you (all)','ihr','euch','euch')"
    @db.execute"#{sql}'they','sie','sie','ihnen')"
    @db.execute"#{sql}'you (formal)','Sie','Sie','Ihnen')"
  end

  def create_tenses_table
    puts 'Creating tenses table...'
    @db.execute %q{
    Create table tenses (
      id integer primary key Autoincrement,
      description varchar(10),
      tense varchar(10)
      )
    }

    i = 0
    sql =  "Insert into tenses(description,tense) values("
    puts 'Inserting tenses...'
    @db.execute"#{sql}'present','Präsens')"
    @db.execute"#{sql}'preterite', 'Imperfekt, Präteritum')"
    @db.execute"#{sql}'perfect','Perfekt')"
    @db.execute"#{sql}'past perfect','Plusquamperfekt')"
    @db.execute"#{sql}'future','Futur I')"
    @db.execute"#{sql}'future perfect','Futur II')"
  end


  def create_verbs_table
    puts 'Creating verbs table...'
    @db.execute %q{
    Create table verbs (
      id integer primary key Autoincrement,
      tense_id integer,
      infinitive varchar(20),
      ich varchar(20),
      du varchar(20),
      er varchar(20),
      sie_she varchar(20),
      es varchar(20),
      wir varchar(20),
      ihr varchar(20),
      sie varchar(20),
      sie_formal varchar(20),
      foreign key(tense_id) references tenses(id)
      )
    }
  end

end