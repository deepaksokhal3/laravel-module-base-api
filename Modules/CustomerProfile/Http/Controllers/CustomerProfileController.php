<?php

namespace Modules\CustomerProfile\Http\Controllers;
use Illuminate\Http\Resources\Json\Resource;
use Illuminate\Http\Request;
use Modules\CustomerProfile\Entities\User;
use Modules\CustomerProfile\Entities\Documents;

use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth; 
use File;

class CustomerProfileController extends Controller
{

     public $successStatus = 200;
    /**
     * Get all list of users
     * @return Response
     */
    public function index()
    {
        return response()->json(User::where('user_type',0)->get(), 200);
    }

    /**
    * Get single customer user
    * @return Response
    */
    public function single(Int $id)
    {
        if(Auth::check()){
            $data['user'] = Auth::user();
            $data['docs'] = Documents::Where('user_id',Auth::user()->id)->first();
            return response()->json(['success' => $data], $this-> successStatus); 
        }
            else 
                return response()->json(['error' => 'Unauthorised'], 401); 
    }

    /**
     * Update user
     * @return Response
     */
    public function update(Request $req)
    {   
       
        if(User::where('id',request()->segment(3))):
            $user = new User();
            $user->exists = true;
            foreach($req->all() as $key=>$val){
                $user->$key = $val;
            }
            $user->save();
            return response()->json(['success'=>'User successfuly update'],200);
        else:
            return response()->json(['error'=>'User Not exist.'],400);
        endif;
    }

  function createImageFromBase64($image){ 

        $file_data = $image; 
       $file_name = 'image_'.time().'.png'; //generating unique file name; 
       @list($type, $file_data) = explode(';', $file_data);
       @list(, $file_data) = explode(',', $file_data); 
       if($file_data!=""){ // storing image in storage/app/public Folder 
          \Storage::disk('public')->put($file_name,base64_decode($file_data)); 
          return $file_name;
        } 
     }


     public function uploadDocs(Request $req)
    {   
       $user = new User();
       if($req->photo){
         $user->exists = true;
            $user->photo = $this->createImageFromBase64($req->photo);
            $user->save();
       }
       
       $data = array();
        if($req->trade)
            $data['trade'] =  $this->createImageFromBase64($req->trade);
        if($req->proofInsurance)
            $data['proofInsurance'] =  $this->createImageFromBase64($req->proofInsurance);
        $data['status'] = 0;

        $data['user_id'] = Auth::user()->id;
       if(Documents::create($data))
            return response()->json(['success'=>'document successfuly uploaded'],200);
        else
            return response()->json(['success'=>'document Not uploading.'],400);
    }
}
