<?php

namespace Modules\MyOrder\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\MyOrder\Entities\Companies;
use Modules\MyOrder\Entities\Booking;
use Illuminate\Support\Facades\Auth; 
class MyOrderController extends Controller
{
    public $successStatus = 200;
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index($id)
    {
        try{
            $data['booking'] = Booking::whereUserId($id)->get();
            foreach($data['booking'] as $key => $booking){
//                $data['booking'][$key]->companyservice =  CompanyServices::whereCompanyId($data['booking'][$key]->company_id)->whereServiceId($data['booking'][$key]->service_id)->first();
                $data['booking'][$key]->companies;
                $data['booking'][$key]->service;
            }
             return response()->json(['success' => $data,'status' =>'ok'], $this-> successStatus); 

        }catch(\Exception $e){
            return response()->json(['error' => $e->getMessage()], 401);
        }
    }

}
