<?php

namespace Modules\Proposals\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Proposals\Entities\Proposals;
use Modules\Proposals\Entities\Services;
use Illuminate\Support\Facades\Auth; 
use Validator;
class ProposalsController extends Controller
{
    public $successStatus = 200;
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index($id)
    {
        try{
            $data['proposals'] = Proposals::whereUserId($id)->get();
            foreach($data['proposals'] as $key=>$proposal){
                $data['proposals'][$key]->serviceName = Services::whereIn('id',explode(",", $proposal->services))->get();
            }
            return response()->json(['success'=>$data], $this-> successStatus); 
        }catch(\Exception $e ){
            return response()->json(['error'=>$e->getMessage()],401);
        }
    }
    
    function getService(){
        try{
            $services = Services::all();
            return response()->json(['success'=>$services], $this-> successStatus); 
        }catch(\Exception $e ){
            return response()->json(['error'=>$e->getMessage()],401);
        }
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [ 
            'user_id' => 'required|min:1|numeric', 
            'job_title' => 'required|regex:/^[a-zA-Z]+$/u', 
            'location' => 'required', 
            'start_date' => 'required', 
            'end_date' => 'required',
            'services' => 'required',
            'description' => 'required'
        ]);
        if ($validator->fails()) { 

            return response()->json(['error'=>$validator->errors()], 401);            
        }
        try{
            Proposals::create($request->all());
            return response()->json(['success'=>"Proposals create successfully."], $this-> successStatus); 
        }catch(\Exception $e ){
            return response()->json(['error'=>$e->getMessage()],401);
        }
    }


/**
     * Update the specified resource in storage.
     * @param  Request $request
     * @return Response
     */
    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [ 
            'id' => 'required|min:1|numeric', 
            'user_id' => 'required|min:1|numeric', 
            'job_title' => 'required|regex:/^[a-zA-Z]+$/u', 
            'location' => 'required', 
            'start_date' => 'required', 
            'end_date' => 'required',
            'services' => 'required',
            'description' => 'required'
        ]);
        if ($validator->fails()) { 

            return response()->json(['error'=>$validator->errors()], 401);            
        }
        try{
            $proposal = new Proposals();
            $proposal->exists = true;
            foreach($request->all() as  $key => $field):
                $proposal->$key = $field;
            endforeach;
            $proposal->save();
            return response()->json(['success'=>"proposal update successfully."], $this->successStatus); 
        }catch(\Exception $e ){
            return response()->json(['error'=>$e->getMessage()],401);
        }
    }


    /**
     * Store a newly created resource in storage.
     * @param  Request $request
     * @return Response
     */
    public function delete($id)
    {
        Proposals::find($id)->delete();
    }

    
}
