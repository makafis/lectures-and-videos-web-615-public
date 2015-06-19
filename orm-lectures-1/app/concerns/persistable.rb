module Persistable
  module ClassMethods
    def db
      DB[:conn]
    end    
    
    def drop_table
      sql = <<-SQL
        DROP TABLE #{self.table_name}
      SQL
      self.db.execute(sql)
    end    

    def public_attributes
      attributes.keys.reject{|k| k == :id}
    end

    def table_name
      "#{self.to_s.downcase}s"
    end

    def create_table
      create_statement = attributes.collect{|k,v| "#{k} #{v}"}.join(", ")

      sql = <<-SQL
        CREATE TABLE IF NOT EXISTS #{table_name} (#{create_statement});
      SQL

      self.db.execute(sql)
    end

    def find_by(opts = {})
      key = opts.keys.first

      sql = <<-SQL
        SELECT * FROM #{table_name} WHERE #{key} = ? LIMIT 1
      SQL

      row = self.db.execute(sql, opts[key]).flatten
      self.new_from_row(row)
    end

    def all
      sql = <<-SQL
        SELECT * FROM #{table_name}
      SQL

      rows = db.execute(sql)
      rows.collect do |row|
        self.new_from_row(row) #[1,"Title", "Content"]
      end
    end

    def new_from_row(row)
      if !row.flatten.compact.empty?
        self.new(row[0]).tap do |p|
          public_attributes.each.with_index(1) do |attribute, i|
            p.send("#{attribute}=", row[i])
          end
        end
      end
    end
  end

  module InstanceMethods
    def initialize(id = nil)
      @id = id
    end

    def destroy
      sql = <<-SQL
        DELETE FROM #{self.class.table_name} WHERE id = ?;
      SQL

      self.class.db.execute(sql, self.id)
      self.freeze
    end

    def ==(other_post)
      self.id == other_post.id
    end

    def persisted?
      !!self.id
    end

    def save
      if !frozen?
        persisted? ? update : insert
      end
    end

    def attribute_values
      self.class.public_attributes.collect{|k| self.send(k) }
    end

    private

      def update
        sql_for_update = self.class.public_attributes.collect{|k| "#{k} = ?"}.join(",")

        sql = <<-SQL
          UPDATE #{self.class.table_name}
          SET #{sql_for_update}
          WHERE id = ?
        SQL

        self.class.db.execute(sql, *attribute_values, self.id)
      end

      def insert
        sql_for_insert = self.class.public_attributes.join(",")
        question_marks_for_sql = self.class.public_attributes.collect{"?"}.join(",")

        sql = <<-SQL 
          INSERT INTO #{self.class.table_name} (#{sql_for_insert}) VALUES
          (#{question_marks_for_sql}) 
        SQL

        self.class.db.execute(sql, *attribute_values)

        sql = <<-SQL
          SELECT last_insert_rowid() FROM #{self.class.table_name}
        SQL

        @id = self.class.db.execute(sql)[0][0]
      end    
  end
end






 

