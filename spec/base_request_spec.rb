
def make_ajax_req url
  script = <<-JAVASCRIPT
var oReq = new XMLHttpRequest();
oReq.open("get", "#{url}", true);
oReq.send();
JAVASCRIPT
  page.driver.execute_script script
end



describe Aokay::BaseRequest, "#find_requests", type: :feature do 

  it "should return an array of requests" do
    visit '/'
    make_ajax_req "http://flibble.com"
    result = Aokay::BaseRequest.find_requests(/flib/)
    expect(result).to be_a_kind_of(Array)
    expect(result.size).to eq(1)
  end

end
