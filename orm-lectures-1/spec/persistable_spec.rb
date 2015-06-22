describe Persistable do
  let(:Post) do
    class Post
      ATTRIBUTES = {
        :id => "INTEGER PRIMARY KEY AUTOINCREMENT",
        :title => "TEXT",
        :content => "TEXT"
      }

      extend Persistable::ClassMethods
      include Persistable::InstanceMethods
    end
  end
  
  describe '.create_table' do
  end

  describe '.drop_table' do
  end

  before(:each) do
    Post.create_table
  end

  after(:each) do
    Post.drop_table
  end

  describe Persistable::ClassMethods do
    describe '.new_from_row' do
      it 'initializes a post from an array representing a row of data in a database' do
        post = Post.new_from_row([1,"Title", "Content"])
        expect(post.id).to eq(1)
        expect(post.title).to eq("Title")
        expect(post.content).to eq("Content")
      end
    end

    describe '.find_by' do
      it 'finds a post from the DB via any column name and value' do
        post = Post.new.tap{|p| p.title = "Title"; p.content = "Content"; p.save}

        expect(Post.find_by(:id => 1)).to eq(post)
        expect(Post.find_by(:title => "Title")).to eq(post)
        expect(Post.find_by(:content => "Content")).to eq(post)
      end
    end

    describe ".all" do
    end

    describe '.db' do

    end

    describe '.attributes' do
    end

    describe '.public_attributes' do
    end

    describe '.table_name' do
    end
  end

  describe Persistable::InstanceMethods do
    it 'can include and extend the module' do      
      expect(Post.included_modules.include?(subject)).to be(true)
    end

    it 'considers posts with the same id to be equal' do
      p_1 = Post.new(1)
      p_2 = Post.new(1)

      expect(p_1).to eq(p_2)
    end
  end
end