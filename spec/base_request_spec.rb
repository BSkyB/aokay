Thread.abort_on_exception = true
describe Aokay::BaseRequest, type: :feature do

  describe "#all" do
    it "should return all requests" do
      visit '/'
      make_ajax_req "http://flibble.com"
      result = Aokay::BaseRequest.all
      expect(result).to be_a_kind_of(Array)
      expect(result[0]).to be_a_kind_of(Aokay::BaseRequest)
      expect(result.size).to eq(2)
    end
  end

  describe "#last" do
    it "should return all requests" do
      visit '/'
      make_ajax_req "http://flibble.com"
      result = Aokay::BaseRequest.last
      expect(result).to be_a_kind_of(Aokay::BaseRequest)
    end
  end

  describe "#host" do
    it "should return the request host" do
      visit '/'
      make_ajax_req "http://flibble.com"
      result = Aokay::BaseRequest.last
      expect(result.host).to eql "flibble.com"
    end
  end


  describe '#wait_for_request' do
    it 'returns if a matching request has been made' do
      visit '/'
      make_ajax_req 'http://flibble.com'
      Timeout.timeout(0.1) do
        result = Aokay::BaseRequest.cursor.wait_for(2){|r| r.host == 'flibble.com'}
        expect(result.host).to eql 'flibble.com'
      end
    end

    it 'blocks until a request is made' do
      visit '/'
      begin
        wait_thread = Thread.new{
          Aokay::BaseRequest.cursor.wait_for(2){|r| r.host == 'flibble.com'}
        }
        sleep(0.1)
        expect(wait_thread).to be_alive
        make_ajax_req 'http://flibble.com'
        Timeout.timeout(0.1) do
          result = wait_thread.value
          expect(result.host).to eql 'flibble.com'
        end
      ensure
        wait_thread.kill
      end
    end
  end

end
