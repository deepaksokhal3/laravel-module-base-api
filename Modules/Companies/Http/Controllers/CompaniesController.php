<?php

namespace Modules\Companies\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Companies\Entities\Services;
use Modules\Companies\Entities\Companies;
use Modules\Companies\Entities\CompanyServices;
use Illuminate\Support\Facades\Auth; 
use Validator;
class CompaniesController extends Controller
{
    public $successStatus = 200;
    /**
     * Create company profile
     * @return Response
     */
    
    
    function index($id){
        
        try{
            $data['company'] = Companies::find($id);
            $sevices=array();
            $data['comp_services'] = Companies::find($id)->serviceIds;
            
            $data['rating'] = Companies::find($id)->rating;
            foreach($data['comp_services'] as $key => $serviceRel){
                $data['comp_services'][$key]->service_name = CompanyServices::find($serviceRel->id)->service;
               
            }
           return response()->json(['success'=>$data], $this-> successStatus); 
        }  catch (\Exception $e){
             return response()->json(['error'=>$e->getMessage()],401);
        }
        
    }
    
    
    
    public function add(Request $request)
    {
        $validator = Validator::make($request->all(), [ 
            'user_id' => 'required|min:1|numeric', 
            'compnay_name' => 'required|regex:/^[a-zA-Z]+$/u', 
            'address' => 'required', 
            'city' => 'required|regex:/^[a-zA-Z]+$/u', 
            'pin_code' => 'required', 
            'country' => 'required',
            'state' => 'required',
            'company_number' => 'required|min:10|numeric', 
            'description' => 'required', 
            'working_days' => 'required|numeric',
            'start_time' => 'required',
            'end_time' => 'required',
            'official_email' => 'required|email',
            'booking_opening_days' => 'required|numeric',
            'booking_per_hour' => 'required|numeric',
        ]);
        if ($validator->fails()) { 

            return response()->json(['error'=>$validator->errors()], 401);            
        }
        try{
            Companies::create($request->all());
            return response()->json(['success'=>"Company create successfully."], $this-> successStatus); 
        }catch(\Exception $e ){
            return response()->json(['error'=>$e->getMessage()],401);
        }
        
    }
    
    /**
     * Update company profile .
     * @param  Request $request
     * @return Response
     */
    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [ 
            'id' => 'required|min:1|numeric', 
            'user_id' => 'required|min:1|numeric', 
            'compnay_name' => 'required|regex:/^[a-zA-Z]+$/u', 
            'address' => 'required', 
            'city' => 'required|regex:/^[a-zA-Z]+$/u', 
            'pin_code' => 'required', 
            'country' => 'required',
            'state' => 'required',
            'company_number' => 'required|min:10|numeric', 
            'description' => 'required', 
            'working_days' => 'required',
            'start_time' => 'required',
            'end_time' => 'required',
            'official_email' => 'required|email',
            'booking_opening_days' => 'required|numeric',
            'booking_per_hour' => 'required|numeric',
        ]);
        if ($validator->fails()) { 

            return response()->json(['error'=>$validator->errors()], 401);            
        }
       
        try{
            $provider = new Companies();
            $provider->exists = true;
            $provider->admin_email_status = 0;
            $provider->status = 'approved';
            foreach($request->all() as  $key => $field):
                $provider->$key = $field;
            endforeach;
            $provider->save();
            return response()->json(['success'=>"Company update successfully."], $this->successStatus); 
        }catch(\Exception $e ){
            return response()->json(['error'=>$e->getMessage()],401);
        }
        
    }

    /**
     * add  company services.
     * @param  Request $request
     * @return Response
     */
    public function add_service(Request $request)
    {
      
        $validator = Validator::make($request->all(), [ 
            'service_id' => 'required|min:1|numeric', 
            'user_id' => 'required|min:1|numeric', 
            'service_type' => 'required|min:1|numeric', 
            'company_id' => 'required|min:1|numeric', 
            'price' => 'required|regex:/^[+-]?([0-9]*[.])?[0-9]+$/', 
            'time' => 'required', 
        ]);
        if ($validator->fails()) { 

            return response()->json(['error'=>$validator->errors()], 401);            
        }
        try{
            $request->merge(['cat_id' => Services::whereId(22)->first()->cat_id]);
            CompanyServices::create($request->all());
            return response()->json(['success'=>"Service assign."], $this->successStatus); 

        }catch(\Exception $e ){
            return response()->json(['error'=>$e->getMessage()],401);
        }
    }


     /**
     * update  company services.
     * @param  Request $request
     * @return Response
     */
    public function update_service(Request $request)
    {
        $validator = Validator::make($request->all(), [ 
            'id' => 'required|min:1|numeric',
            'service_id' => 'required|min:1|numeric', 
            'user_id' => 'required|min:1|numeric', 
            'service_type' => 'required|min:1|numeric', 
            'company_id' => 'required|min:1|numeric', 
            'price' => 'required|regex:/^[+-]?([0-9]*[.])?[0-9]+$/', 
            'time' => 'required', 
        ]);
        if ($validator->fails()) { 

            return response()->json(['error'=>$validator->errors()], 401);            
        }

        try{
            $request->merge(['cat_id' => Services::whereId(22)->first()->cat_id]);
            $CompanyServices = new CompanyServices();
            $CompanyServices->exists = true;
            foreach($request->all() as  $key => $field):
                $CompanyServices->$key = $field;
            endforeach;
            $CompanyServices->save();
            return response()->json(['success'=>"Service update successfully."], $this->successStatus); 
        }catch(\Exception $e ){
            return response()->json(['error2'=>$e->getMessage()],401);
        }

    }

    /**
     * update  company services.
     * @return Response
     */
    function get(){

       print_r(CompanyServices::whereServiceId(22)->get());die;

    }
}
