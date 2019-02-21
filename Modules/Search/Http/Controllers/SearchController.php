<?php

namespace Modules\Search\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Search\Entities\CompanyServices;
use Modules\Search\Entities\Companies;
use Modules\Search\Entities\Services;
use Illuminate\Support\Facades\Auth; 

class SearchController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function filter(Request $request)
    {
    try{
        $serviceId = Services::whereName($request->keyword)->pluck('id')->first();
        $companiesIds = CompanyServices::whereServiceId($serviceId)->pluck('company_id')->toArray();
        $data['companies'] = Companies::find($companiesIds);
        foreach($data['companies'] as $key => $company)
            $data['companies'][$key]->rating = CompanyServices::find($company->id)->rating;
        
         return response()->json(['success'=>$data],200);
           
        }  catch (\Exception $e){
            return response()->json(['error'=>$e->getMessage()],401);
        }

    }
    
    function advance_search(Request $request, Companies $companies){
        
        print_r($companies->all());die;
        
        
        
    }


}
