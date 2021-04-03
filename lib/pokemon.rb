require 'pry'

class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(name:, type:, db:, id:)
        @name = name
        @type = type
        @id = id
        @db = db
    end


    def save(name, type, db)
        sql = <<-SQL 
        CREATE TABLE IF NOT EXISTS pokemon (
        id INTEGER PRIMARY KEY,
        name TEXT,
        type TEXT
        )
        SQL
        db.execute(sql)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [self.name, self.type])
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        res = @db.execute(sql, [id])[0]
        self.new(res[0], res[1], res[2])
    end

end
