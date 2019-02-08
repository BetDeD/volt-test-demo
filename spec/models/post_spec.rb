require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:author) { User.new(attributes_for(:user)) }
    describe 'validations' do
      subject {
        described_class.new(title: 'Anything', body: 'Lorem ipsum',
                            published_at: DateTime.now, author: author)
      }

      it "is valid with valid attributes" do
        expect(subject).to be_valid
      end

      it "is not valid without a title" do
        subject.title = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a description" do
        subject.body = nil
        expect(subject).to_not be_valid
      end

    end
    #
    # describe 'associations' do
    #   it { is_expected.to belong_to(:author).class_name('User').with_foreign_key('user_id') }
    # end
    #
    # describe 'delegations' do
    #   it { is_expected.to delegate_method(:nickname).to(:author).with_prefix(true) }
    # end


end
