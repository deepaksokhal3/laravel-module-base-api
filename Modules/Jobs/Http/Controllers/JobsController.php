<?php

namespace Modules\Jobs\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Jobs\Entities\Proposals;
class JobsController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index($id)
    {
        try{
            $data['company'] = Proposals::whereId($id)->whereStatus('approved')->get();
            $data['booking'] = Companies::find($id)->booking;
             return response()->json(['success' => $data,'status' =>'ok'], $this-> successStatus); 

        }catch(\Exception $e){
            return response()->json(['error' => $e->getMessage()], 401);
        }
    }

   
}
