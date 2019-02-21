<?php

namespace Modules\CustomerBooking\Http\Controllers;
use Illuminate\Http\Resources\Json\Resource;
use Illuminate\Http\Request;
use Modules\CustomerBooking\Entities\Booking;
use Modules\CustomerBooking\Entities\Settings;
use Modules\CustomerBooking\Entities\CompanyServices;
use Illuminate\Support\Facades\Auth; 
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Validator;

class CustomerBookingController extends Controller
{

    /**
     * Display a listing of the resource.
     * @return Response
     */
//    public function list($userId)
//    {
//         return response()->json(Booking::find(1)->user, 200);
//    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create(Request $req)
    {        $validator = Validator::make($req->all(), [ 
            'service_id' => 'required|min:1|numeric', 
            'company_id' => 'required|min:1|numeric', 
            'booking_date' => 'required', 
            'booking_address' => 'required',
            'booking_date'=>'date_format:"Y-m-d"|required',
            'booking_time' => 'required', 
            'booking_city' => 'required',
            'payment_mode' => 'required',
            'booking_pincode' => 'required', 
            'booking_note' => 'required', 
            'user_id' => 'required|numeric',
        ]);
        if ($validator->fails()) { 

            return response()->json(['error'=>$validator->errors()], 401);            
        }
        try{
//            echo '<pre>';
//            print_r($req['service_id']);die;
            Booking::create($req->all());
            return response()->json(['success'=>'booking created successfuly.', "status"=>'ok'],200);
        }  catch (\Exception $e){
            return response()->json(['error'=>$e->getMessage()],401);
        }
    }

    /**
     * Checkout added booking.
     * @return Response
     */
    public function checkout(Request $req)
    { 
            if(Booking::where('id',$req->id)->first()):
                $payment = new Booking();
                $payment->exists = true;
                $payment->id = $req->id;
                $payment->admin_commission = $req->admin_commission;
                $payment->total_amt = $req->total_amt;
                $payment->save();
                return response()->json(['status'=>'Booking successfuly update'],200);
            else:
                return response()->json(['status'=>'Booking Not exist.'],400);
            endif;
        
    }

      /**
     * Save payment if strip payment success.
     * @return Response
     */
    public function payment(Request $req)
    {
        if(Booking::where('id',$req->id)->first()):
            $payment = new Booking();
            $payment->exists = true;
            $payment->id = $req->id;
            $payment->status = $req->status;
            $payment->stripe_token = $req->stripe_token;
            $payment->save();
            return response()->json(['status'=>'Payment successfully saved'],200);
        else:
            return response()->json(['status'=>'Booking Not exist.'],400);
        endif;
       
    }
    
    
    function booking_info($id){
        try{
            $data['booking'] = Booking::whereStatus('pending')->whereUserId($id)->first();
                $data['booking']->companyservice =  CompanyServices::whereCompanyId($data['booking']->company_id)->whereServiceId($data['booking']->service_id)->first();
                $data['booking']->companies;
                $data['booking']->companies->users;
                $data['booking']->service;
                $data['booking']->users;
                $data['setting'] = Settings::select(['commission_amt'])->firstOrFail();
             
            
            return response()->json(['success'=>$data, 'status'=>'ok'],200);
      }catch (\Exception $e){
            return response()->json(['error'=>$e->getMessage()],401);
        }
        
    }
    
     function booking_payment_details(Request $request){
        try{
                $data['booking'] = Booking::whereStatus('pending')->whereToken($request->token)->first();
                $data['booking']->companyservice =  CompanyServices::whereCompanyId($data['booking']->company_id)->whereServiceId($data['booking']->service_id)->first();
                $data['booking']->companies;
                $data['booking']->companies->users;
                $data['booking']->service;
                $data['booking']->users;
                $data['setting'] = Settings::find(1);
             
            
            return response()->json(['success'=>$data, 'status'=>'ok'],200);
      }catch (\Exception $e){
            return response()->json(['error'=>$e->getMessage()],401);
        }
        
    }
    
    
    
    function my_bookings($id){
        try{
            $data['booking'] = Booking::whereStatus('paid')->whereUserId($id)->get();
            foreach($data['booking'] as $key => $booking){
                $data['booking'][$key]->companyservice =  CompanyServices::whereCompanyId($data['booking'][$key]->company_id)->whereServiceId($data['booking'][$key]->service_id)->first();
                $data['booking'][$key]->companies;
                $data['booking'][$key]->companies->users;
                $data['booking'][$key]->service;
            }
             
            
            return response()->json(['success'=>$data, 'status'=>'ok'],200);
      }catch (\Exception $e){
            return response()->json(['error'=>$e->getMessage()],401);
        }
        
    }
    
    
    
    
    
}
