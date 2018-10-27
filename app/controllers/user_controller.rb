class UserController < ApplicationController
  def authenticate
    token = params['headers']['Authorization']
    verified_token = verify_firebase_id_token(token)

    User.find_or_create_by!(email: verified_token['email'], firebase_id: verified_token['user_id'])
  end

  private

  def verify_firebase_id_token(token)
    FirebaseIdToken::Certificates.request
    FirebaseIdToken::Signature.verify(token)
  end
end

#### Example token
# {
#   "iss"=>"https://securetoken.google.com/skincare-library-c0019", 
#   "aud"=>"skincare-library-c0019", 
#   "auth_time"=>1536899868, 
#   "user_id"=>"V9MyKB5nRdamIjb8ATdAuYYyR1H2", 
#   "sub"=>"V9MyKB5nRdamIjb8ATdAuYYyR1H2", 
#   "iat"=>1536899869, 
#   "exp"=>1536903469, 
#   "email"=>"hello@beccabarton.com", 
#   "email_verified"=>false, 
#   "firebase"=>{
#     "identities"=>{
#       "email"=>["hello@beccabarton.com"]
#     }, 
#     "sign_in_provider"=>"password"
#   }
# }
###