# frozen_string_literal: true

RSpec.describe RailsCookieOverflow::Middleware do
  let(:app) { ->(_env) { [200, {}, ["OK"]] } }

  let(:my_app) { described_class.new(app) }

  let(:env) { Rack::MockRequest.env_for("http://example.com:8080/") }

  it "expects to handle regular requests normally" do
    status, headers, response = my_app.call(env)

    expect(status).to be(200)
    expect(headers).to be_eql({})
    expect(response).to be_eql(["OK"])
  end

  it "expects to handle CookieOverflow gracefully" do
    expect(app).to receive(:call).and_raise(ActionDispatch::Cookies::CookieOverflow)

    status, headers, response = my_app.call(env)

    expect(status).to be(422)
    expect(headers).to be_eql({ "Content-Type" => "text/plain" })
    expect(response).to be_eql(["Unprocessable Entity"])
  end

  it "expects to propagate other exceptions" do
    expect(app).to receive(:call).and_raise(RuntimeError)

    expect { my_app.call(env) }.to raise_exception(RuntimeError)
  end
end
