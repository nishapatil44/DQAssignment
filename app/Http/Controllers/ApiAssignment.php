<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Image;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;


class ApiAssignment extends Controller
{
    public function register(Request $request){
        // data validation
        try{
            $request->validate([
                "name" => "required",
                "email" => "required|email|unique:users",
                "password" => "required"
            ]);
        }catch(ValidationException $e){
            return $e->errors();
        }
        
        // Author model
        
        $create_user = User::create([
            "name" => $request->name,
            "email" => $request->email,
            "password" => Hash::make($request->password),
            "mobile" => $request->mobile,
            "country" => $request->country,
            "state" => $request->state,
            "city" => $request->city,
            "isActive" => $request->activeUser,
        ]);

        // api Response
        if($create_user){
            return response()->json([
                "status" => true,
                "message" => "User created successfully"
            ]);
        }else{
            return response()->json([
                "status" => false,
                "message" => "User not created"
            ]);
        }
        
    }

    public function login(Request $request)
    {
        //dd($request->all());
        try{
            $request->validate([
                "username" => "required",
                "password" => "required",
            ]);
        }catch(ValidationException $e){
            return $e->errors();
        }
        
        if(Auth::attempt([
            "email" => $request->username,
            "password" => $request->password,
        ]))
        {
            $user = Auth::user();
            $token = $user->createToken("myToken")->accessToken;
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

    public function userLogin(Request $request)
    {
        $user = Auth::user();
        $images = $user->images;
        //dd($images);
        return response()->json([
            "status" => "success",
            "images" => $images,
        ]);
    }

    public function store(Request $request)
    {
        try{
            $request->validate([
                'title' => 'required',
                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
                //'tags' => 'required|array',
            ]);
        }catch(ValidationException $e){
            return $e->errors();
        }
    
        $image = new Image();
        $image->title = $request->title;

        // Handle image upload
        $imagePath = $request->file('image')->store('images', 'public');
        $image->image_path = $imagePath;
        $user = Auth::user();
        
        $image->user_id = $user->id;
        if($image->save()){
            return response()->json([
                "message" => "Images stored successfully",
                "status" => "success"
            ]);
        }

        // Attach tags to the image
        $tags = $request->tags;
        $image->tags()->sync($tags);

        return redirect()->route('images.index')->with('success', 'Image uploaded successfully.');
    }
}
