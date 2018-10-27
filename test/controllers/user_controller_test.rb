require 'test_helper'

class UserControllerTest < ActionController::TestCase
  def setup
  end
  
  test 'can authenticate a user given a firebase id token' do
    request.env['HTTP_AUTHORIZATION'] = 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjE3ZTBmNDI1NjRlYjc0Y2FlNGZkNDhiZGE5ZjA0YmE2OTRmNDExNDQifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vc2tpbmNhcmUtbGlicmFyeS1jMDAxOSIsImF1ZCI6InNraW5jYXJlLWxpYnJhcnktYzAwMTkiLCJhdXRoX3RpbWUiOjE1MzcwMjkwMDgsInVzZXJfaWQiOiJWOU15S0I1blJkYW1JamI4QVRkQXVZWXlSMUgyIiwic3ViIjoiVjlNeUtCNW5SZGFtSWpiOEFUZEF1WVl5UjFIMiIsImlhdCI6MTUzNzAyOTAwOSwiZXhwIjoxNTM3MDMyNjA5LCJlbWFpbCI6ImhlbGxvQGJlY2NhYmFydG9uLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJoZWxsb0BiZWNjYWJhcnRvbi5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.o8v8GTGjNDgqipagyMuW6yio2o7Hre1THzS0DwFm5u_jz9lSwV7_BuBu5FZW-HnDm_ZVO_w2V5QrPIGFRzsk8cfBYWfBhI01tjW3HtyWr9Fiytcj1eIOwX1c2NirE5kDnUKpqLaof6f8YG202O5JUo24hjmvu5yqrx_KmGGORjOUsHfbj34BBFisR3EKCsr-7YGc71zcbZSbX3_VyFyZZ16wqYH_qpOoxXT2zVguVwIql6-2hhC9RvpUsTFwicet8HqHQcXeKt0_UHe0hH-kRzf6xrjjAO2UZeESpiCNw94dzNod4VplfxEZf59CEX1_H83zoh0MtEDkJ_g8mj3_xg'
    
    post '/authenticate'

    assert_response :success
    assert_equal User.find_by(firebase_id: 'V9MyKB5nRdamIjb8ATdAuYYyR1H2')
  end
end