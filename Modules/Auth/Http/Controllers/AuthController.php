<?php

namespace Modules\Auth\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Input;
use Modules\Auth\Entities\User;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth; 
use Mail;
use Validator;
use URL;
class AuthController extends Controller
{
    public $successStatus = 200;
    /** 
         * login api 
         * 
         * @return \Illuminate\Http\Response 
         */ 
        public function login(Request $req){ 
            if(Auth::attempt(['email' => $req->email, 'password' => $req->password])){ 
                $user = Auth::user(); 
                $success['token'] =  $user->createToken('MyApp')-> accessToken; 
                $success['user'] = $user;
                return response()->json(['success' => $success,'status' =>'ok'], $this-> successStatus); 
            } 
            else{ 
                return response()->json(['error'=>'Unauthorise','status' =>'faild'], 401); 
            } 
        }
    /** 
         * Register api 
         * 
         * @return \Illuminate\Http\Response 
         */ 
        public function register(Request $request) 
        { 
            $validator = Validator::make($request->all(), [ 
                'name' => 'required', 
                'lname' => 'required|regex:/^[a-zA-Z]+$/u', 
                'fname' => 'required|regex:/^[a-zA-Z]+$/u', 
                'phone' => 'required|min:10|numeric', 
                'user_type' => 'required|numeric', 
                'service_type' => 'required|numeric',
                'gender' => 'required|regex:/^[a-zA-Z]+$/u',
                'email' => 'required|email|unique:users,email', 
                'password' => 'required', 
                'c_password' => 'required|same:password',
            ]);
            if ($validator->fails()) { 

                return response()->json(['error'=>$validator->errors()], 401);            
            }
            $access_token =str_random(50);
            $input = $request->all(); 
            $input['password'] = bcrypt($input['password']); 
            $user = User::create($input); 
            $data['user'] = $user;
            $data['token'] =  $user->createToken('MyApp')->accessToken; 

            $link = URL::to('/sign-up/'.$user->id.'/'.$access_token);
            $data['link'] = $link;
            // back()->with('success', 'Please verify account by we have sent a mail.');
            // Mail::send('emails.register', ['fname' => ucfirst($user->fname), 'lname' => ucfirst($user->lname), 'link' =>$link], 
            // function ($message)
            // {
            //     $message->subject('Verify Registered account. ');
            //     $message->from('info@hometrumpeter.com', 'Hometrumpeter');
            //     $message->to(Input::get('email'));
            // });

            return response()->json(['success'=>$data], $this-> successStatus); 
        }
    /** 
         * details api 
         * 
         * @return \Illuminate\Http\Response 
         */ 
        public function details() 
        { 
            if(Auth::check())
                return response()->json(['success' => Auth::user()], $this-> successStatus); 
            else 
                return response()->json(['error' => 'Unauthorised'], 401); 
           
        } 
}
