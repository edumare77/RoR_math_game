require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", surname: "example  surname", level: "Beginner", categorie: "Student", score: 0, user_name: "Example_usnam",
    password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
      @user.name = "     "
      assert_not @user.valid?
    end
    
  test "surname should be present" do
        @user.surname = "     "
        assert_not @user.valid?
      end
      
  test "level should be present" do
        @user.level = "     "
        assert_not @user.valid?
      end
      
  test "user_name should be present" do
        @user.user_name = "     "
        assert_not @user.valid?
      end
      
    test "score should be present" do
          @user.score = ""
          assert_not @user.valid?
        end
        
  test "categorie should be present" do
            @user.categorie = ""
            assert_not @user.valid?
          end
      
  test "name should not be too long" do
      @user.name = "a" * 51
      assert_not @user.valid?
    end
    
  test "surname should not be too long" do
      @user.surname = "a" * 51
      assert_not @user.valid?
    end
    
  test "level should be begin, inter or prof" do
          @user.level = "beginlos"
          assert_not @user.valid?
        end
        
  test "categorie should be Student or Teacher" do
            @user.level = "beginlos"
            assert_not @user.valid?
          end
        
  test "user_name should not be too long" do
        @user.user_name = "a" * 51
        assert_not @user.valid?
      end
      
  test "user_name should be unique" do
      duplicate_user = @user.dup
    duplicate_user.user_name = @user.user_name
      @user.save
      assert_not duplicate_user.valid?
    end
    
  test "password should be present (nonblank)" do
      @user.password = @user.password_confirmation = " " * 6
      assert_not @user.valid?
    end
  
    test "password should have a minimum length" do
      @user.password = @user.password_confirmation = "a" * 5
      assert_not @user.valid?
    end
end