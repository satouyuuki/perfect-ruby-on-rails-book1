# require 'rails_helper'

# RSpec.describe Event, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
require 'rails_helper'

# RSpec.describe Event, :type => :model do
#   it 'nameが空白の時にvalid でないこと' do
#     event = Event.new(name: '') 
#     event.valid?
#     expect(event.errors[:name]).to be_present
#   end
# end
# describe Event do
#   describe '#name' do
#     context '空白の時' do
#       it 'valid でないこと' do
#         event = Event.new(name: '')
#         event.valid?
#         expect(event.errors[:name]).to be_present
#       end
#     end
#   end
# end
describe Event do
  describe '#name' do
    it {should validate_presence_of(:name)}
    it {should ensure_length_of(:name).is_at_most(50)}
  end
  describe '#created_by?' do
    let(:event) {create(:event)}
    subject {event.created_by?(user)}

    context '引数が nil な時' do
      let(:user) {nil}
      it {should be_falsey}
    end

    context '#owner_id と引数の#id が同じ時' do
      let(:user) {double('user', id: event.id)}
      it {should be_truthy}
    end
  end
end