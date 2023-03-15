require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  setup { @order = orders.first }

  test 'should send confirmation email to user who placed the order' do
    mail = OrderMailer.send_confirmation(@order)
    assert_equal 'Order confirmation', mail.subject
    assert_equal [@order.user.email], mail.to
    assert_equal ['no-reply@traidr.com'], mail.from
    assert_match "Order: ##{@order.id}", mail.body.encoded
    assert_match "You ordered #{@order.products.count} products", mail.body.encoded
  end
end
