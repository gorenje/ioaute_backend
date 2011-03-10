require File.expand_path('../../test_helper.rb', __FILE__)

class PublicationTest < ActiveSupport::TestCase
  context "finding by base62 or uuid" do
    should "retrieval by uuid" do
      pub1, pub2, pub3 = ([:publication]*3).map { |a| Factory(a) }
      assert_equal pub1, Publication.find_by_uuid_or_base62!(pub1.uuid)
      assert_equal pub2, Publication.find_by_uuid_or_base62!(pub2.uuid.to_i(16).base62_encode)

      assert_raises ActiveRecord::RecordNotFound do
        assert_equal pub3, Publication.find_by_uuid_or_base62!(pub3.id)
      end
    end
    
    should "be able to pass options" do
      pub1, pub2, pub3 = ([:publication]*3).map { |a| Factory(a) }
      assert_equal pub1, Publication.find_by_uuid_or_base62!(pub1.uuid, :include => :pages)
    end
    
    should "do something if something is not found" do
      Publication.delete_all
      assert_raises ActiveRecord::RecordNotFound do
        Publication.find_by_uuid_or_base62!(12)
      end

      assert_raises ActiveRecord::RecordNotFound do
        Publication.find_by_uuid_or_base62!(Publication.generate_uuid)
      end

      pub = Publication.new( :uuid => Publication.generate_uuid)
      assert_raises ActiveRecord::RecordNotFound do
        Publication.find_by_uuid_or_base62!(pub.uuid_base62)
      end
    end
  end

  context "named scopes" do
    should "only retrieve not deleted" do
      Publication.delete_all
      pub1, pub2, pub3, pub4 = ([:publication]*4).map { |a| Factory(a) }
      
      assert_equal 4, Publication.not_deleted.count
      pub1.forget_it!
      assert_equal 3, Publication.not_deleted.count
      pub2.forget_it!
      assert_equal 2, Publication.not_deleted.count
      pub3.forget_it!
      assert_equal 1, Publication.not_deleted.count
      pub4.forget_it!
      assert_equal 0, Publication.not_deleted.count
    end
    
    should "only retrieve for a user" do
      Publication.delete_all
      pub1, pub2, pub3, pub4 = ([:publication]*4).map { |a| Factory(a) }

      user = Factory(:user)
      assert_equal 0, Publication.for_user(user).count
      pub1.user = user ; pub1.save
      assert_equal 1, Publication.for_user(user).count
      pub2.user = user ; pub2.save
      assert_equal 2, Publication.for_user(user).count
      pub3.user = user ; pub3.save
      assert_equal 3, Publication.for_user(user).count
      pub4.user = user ; pub4.save
      assert_equal 4, Publication.for_user(user).count
    end
  end
  
  context "states" do
    should "be viewable if published or created or editing" do
      pub = Factory(:publication)
      assert pub.viewable?
      assert pub.created?

      assert pub.begin_edit
      assert pub.editing?
      assert pub.viewable?
      
      assert pub.publish
      assert pub.published?
      assert pub.viewable?
      
      # once a publication is published, it can't be deleted.
      assert_raises StateMachine::InvalidTransition do
        assert pub.forget_it!
      end
    end
  end
  
  context "uuid" do
    should "be able to generate a uuid" do
      assert_equal 20, Publication.generate_uuid.length
    end

    should "be convertible to base62" do
      { 
        "ffff"    => "H31",
        "ffee"    => "H2k",
        "0"       => "0",
        "ef123ae" => "GxqRi",
      }.each do |uuid, base62_uuid|
        assert_equal(base62_uuid, Publication.new(:uuid => uuid).uuid_base62, 
                     "Failed for #{uuid}")
      end
    end
  end
end
