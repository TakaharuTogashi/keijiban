require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryGirl.build(:post) }

  specify '妥当なオブジェクト' do
    expect(post).to be_valid
  end

  %w{name comment}.each do |column|
    specify "#{column} は空であってはならない" do
      post[column] = ''
      expect(post).not_to be_valid
      expect(post.errors[column]).to be_present
    end
  end

  specify '妥当な email' do
    post[:email] = 'ax5sc46v57b68t@mik67jnubhy5v.com'
    expect(post).to be_valid
  end

  specify '無効な email' do
    post[:email] = 'e8vr9ty0u-i=hgf'
    expect(post).not_to be_valid
    expect(post.errors[:email]).to be_present
  end
end
