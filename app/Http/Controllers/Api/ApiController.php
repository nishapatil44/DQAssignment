<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\State;
use App\Models\City;

class ApiController extends Controller
{

    public function addUser(){
        $countries = DB::table('countries')->get();
        return view('register', compact('countries'));
    }
    
    public function getStates(Request $request, $country_id)
    {
        $states = State::where('country_id', $country_id)->pluck('name','id');
        return response()->json($states);
    }
    public function getCities(Request $request, $state_id)
    {
        $cities = City::where('state_id', $state_id)->pluck('name','id');
        return response()->json($cities);
    }
    public function register(Request $request){
        // data validation
        $request->validate([
            "name" => "required",
            "email" => "required|email|unique:users",
            "password" => "required"
        ]);
        // Author model
        
        $create_user = User::create([
            "name" => $request->name,
            "email" => $request->email,
            "password" => Hash::make($request->password),
            "mobile" => $request->mobile,
            "country" => $request->country,
            "state" => $request->state,
            "city" => $request->city,
        ]);

        return back()->with('success', 'Registered Sccessfully');
        // api Response
        return response()->json([
            "status" => true,
            "message" => "User created successfully"
        ]);
    }

    public function login(Request $request)
    {
        //dd($request->all());
        $request->validate([
            "username" => "required",
            "password" => "required",
        ]);
        if(Auth::attempt([
            "email" => $request->username,
            "password" => $request->password,
        ]))
        {
            $user = Auth::user();
            //dd(session('user_role'));
            if($user->isAdmin()){
                return redirect()->route('register');
            }elseif($user->isActive()){
                return redirect()->route('images.search');
            }else{
                return redirect()->route('images.index');
            }
            
            //dump($user);
            $token = $user->createToken("myToken")->accessToken;
           // dd($token);
           return response()->json([
            "status" => true,
            "message" => "Login successful",
            "access_token" => $token
           ]);
        }
        return response()->json([
            "status" => false,
            "message" => "Invalid credentials"
        ]);
    }

    public function profile()
    {
        $userdata = Auth::User();
        return response()->json([
            "status" => true,
            "message" => "Profile data",
            "data" => $userdata
        ]);
    }

}
